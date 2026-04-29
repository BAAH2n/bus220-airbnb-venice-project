library(tidyverse)
library(lubridate)

clean_listings <- function(path, quarter) {
  read_csv(path, show_col_types = FALSE) |>
    filter(last_scraped == max(last_scraped, na.rm = TRUE)) |>
    mutate(
      scrape_quarter = quarter,
      price = price |>
        str_remove_all("[$,]") |>
        as.double(),
      host_response_rate = host_response_rate |>
        str_remove("%") |>
        na_if("N/A") |>
        as.double(),
      host_acceptance_rate = host_acceptance_rate |>
        str_remove("%") |>
        na_if("N/A") |>
        as.double(),
      host_since   = ymd(host_since),
      first_review = ymd(first_review),
      last_review  = ymd(last_review),
      last_scraped = ymd(last_scraped),
      calendar_last_scraped = ymd(calendar_last_scraped)
    )
}

listings_jun <- clean_listings("https://github.com/BAAH2n/bus220-airbnb-venice-project/releases/latest/download/listings-june.csv",
                               "June")
listings_sep <- clean_listings("https://github.com/BAAH2n/bus220-airbnb-venice-project/releases/latest/download/listings-september.csv",
                               "September")

listings <- bind_rows(listings_jun, listings_sep)



reviews_jun <- read_csv("https://github.com/BAAH2n/bus220-airbnb-venice-project/releases/latest/download/reviews-june.csv")
reviews_sep <- read_csv("https://github.com/BAAH2n/bus220-airbnb-venice-project/releases/latest/download/reviews-sept.csv")

reviews <- bind_rows(reviews_jun, reviews_sep) |>
  distinct(id, .keep_all = TRUE)


profile <- list()

profile$rows_total       <- nrow(listings)
profile$rows_jun         <- nrow(listings_jun)
profile$rows_sep         <- nrow(listings_sep)
profile$unique_listings  <- n_distinct(listings$id)
profile$unique_hosts     <- n_distinct(listings$host_id)

profile$scrape_overlap <- listings |>
  count(id, name = "appears_in") |>
  count(appears_in, name = "n_listings") |>
  mutate(label = if_else(appears_in == 2, "in both", "in one only"))

profile$price_stats <- listings |>
  summarise(
    n_with_price = sum(!is.na(price)),
    min   = min(price, na.rm = TRUE),
    p25   = quantile(price, 0.25, na.rm = TRUE),
    median = median(price, na.rm = TRUE),
    mean  = mean(price, na.rm = TRUE),
    p75   = quantile(price, 0.75, na.rm = TRUE),
    p95   = quantile(price, 0.95, na.rm = TRUE),
    p99   = quantile(price, 0.99, na.rm = TRUE),
    max   = max(price, na.rm = TRUE)
  )

profile$null_rates <- listings |>
  summarise(across(
    c(price,
      host_response_rate, host_acceptance_rate,
      review_scores_rating, review_scores_cleanliness, review_scores_location,
      estimated_occupancy_l365d, estimated_revenue_l365d,
      license,
      neighbourhood_cleansed, neighbourhood_group_cleansed,
      calendar_updated,
      bathrooms_text,
      source),
    ~ round(mean(is.na(.x)) * 100, 1),
    .names = "{.col}"
  )) |>
  pivot_longer(everything(), names_to = "field", values_to = "pct_null") |>
  arrange(desc(pct_null))

profile$by_room_type     <- listings |> count(room_type, sort = TRUE)
profile$by_source        <- listings |> count(source, sort = TRUE)
profile$top_neighbourhoods <- listings |>
  count(neighbourhood_cleansed, sort = TRUE) |>
  slice_head(n = 15)

profile$host_tier_breakdown <- listings |>
  filter(scrape_quarter == "September") |>
  mutate(
    tier = case_when(
      is.na(calculated_host_listings_count)         ~ NA_character_,
      calculated_host_listings_count == 1           ~ "Single",
      calculated_host_listings_count <= 5           ~ "Small (2-5)",
      calculated_host_listings_count <= 20          ~ "Medium (6-20)",
      TRUE                                          ~ "Commercial (21+)"
    ),
    tier = factor(tier, levels = c("Single", "Small (2-5)", "Medium (6-20)", "Commercial (21+)"))
  ) |>
  group_by(tier) |>
  summarise(
    hosts    = n_distinct(host_id),
    listings = n(),
    .groups  = "drop"
  ) |>
  mutate(
    `% of supply` = round(listings / sum(listings) * 100, 1)
  ) |>
  arrange(tier)

profile$host_listings_compare <- listings |>
  summarise(
    n_listings   = n(),
    both_known   = sum(!is.na(calculated_host_listings_count) & !is.na(host_listings_count)),
    counts_match = sum(calculated_host_listings_count == host_listings_count, na.rm = TRUE),
    counts_differ = sum(calculated_host_listings_count != host_listings_count, na.rm = TRUE),
    max_abs_diff = max(abs(calculated_host_listings_count - host_listings_count), na.rm = TRUE)
  )

profile$reviews_total       <- nrow(reviews)
profile$reviews_jun         <- nrow(reviews_jun)
profile$reviews_sep         <- nrow(reviews_sep)
profile$reviews_dedup_dropped <- (nrow(reviews_jun) + nrow(reviews_sep)) - nrow(reviews)
profile$reviews_date_range  <- range(ymd(reviews$date), na.rm = TRUE)


md_table <- function(df) {
  paste(knitr::kable(df, format = "pipe"), collapse = "\n")
}

md <- c(
  "# Data Profile Report — Venice Airbnb",
  "## Listings",
  paste0("- Rows total: **", profile$rows_total, "**"),
  paste0("  - June scrape: ", profile$rows_jun),
  paste0("  - September scrape: ", profile$rows_sep),
  paste0("- Unique listings (`id`): ", profile$unique_listings),
  paste0("- Unique hosts (`host_id`): ", profile$unique_hosts),
  "",
  "### Scrape overlap",
  md_table(profile$scrape_overlap),
  "",
  "### Price distribution after cleaning",
  md_table(profile$price_stats),
  "",
  "### NULL-rates (% null) for key fields",
  md_table(profile$null_rates),
  "",
  "### By room type",
  md_table(profile$by_room_type),
  "",
  "### By source (carry-over vs new)",
  md_table(profile$by_source),
  "",
  "### Host tier breakdown (September scrape, active listings only)",
  md_table(profile$host_tier_breakdown),
  "",
  "### Host listings count: calculated vs host (per brief)",
  md_table(profile$host_listings_compare),
  "",
  "### Top 15 neighbourhoods",
  md_table(profile$top_neighbourhoods),
  "",
  "## Reviews",
  paste0("- Total (after dedup): **", profile$reviews_total, "**"),
  paste0("  - June scrape: ", profile$reviews_jun),
  paste0("  - September scrape: ", profile$reviews_sep),
  paste0("  - Duplicates removed (in both scrapes): ", profile$reviews_dedup_dropped),
  paste0("- Date range: ",
         format(profile$reviews_date_range[1]), " to ",
         format(profile$reviews_date_range[2]))
)
writeLines(md, "profile_report.md")

clean_text <- function(x) str_replace_all(x, "[\r\n\t]+", " ")
listings <- listings |> mutate(across(where(is.character), clean_text))
reviews  <- reviews  |> mutate(across(where(is.character), clean_text))

write_csv(listings, "listings_clean.csv", na = "", quote = "all")
write_csv(reviews,  "reviews_clean.csv",  na = "", quote = "all")


