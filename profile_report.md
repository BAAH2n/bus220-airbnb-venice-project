# Data Profile Report — Venice Airbnb

## Listings
- Rows total: **16840**
  - June scrape: 8250
  - September scrape: 8590
- Unique listings (`id`): 9041
- Unique hosts (`host_id`): 3920

### Scrape overlap
| appears_in| n_listings|label       |
|----------:|----------:|:-----------|
|          1|       1242|in one only |
|          2|       7799|in both     |

### Price distribution after cleaning
| n_with_price| min| p25| median|     mean| p75| p95|  p99|   max|
|------------:|---:|---:|------:|--------:|---:|---:|----:|-----:|
|        14963|  10| 111|    156| 234.9463| 225| 500| 1200| 14264|

### NULL-rates (% null) for key fields
|field                        | pct_null|
|:----------------------------|--------:|
|calendar_updated             |    100.0|
|price                        |     11.1|
|host_response_rate           |     11.1|
|estimated_revenue_l365d      |     11.1|
|review_scores_rating         |      9.0|
|review_scores_cleanliness    |      9.0|
|review_scores_location       |      9.0|
|host_acceptance_rate         |      5.9|
|license                      |      5.6|
|bathrooms_text               |      0.1|
|estimated_occupancy_l365d    |      0.0|
|neighbourhood_cleansed       |      0.0|
|neighbourhood_group_cleansed |      0.0|
|source                       |      0.0|

### By room type
|room_type       |     n|
|:---------------|-----:|
|Entire home/apt | 13101|
|Private room    |  3540|
|Hotel room      |   174|
|Shared room     |    25|

### By source (carry-over vs new)
|source          |     n|
|:---------------|-----:|
|city scrape     | 14968|
|previous scrape |  1872|

### Host tier breakdown (September scrape, active listings only)
|tier             | hosts| listings| % of supply|
|:----------------|-----:|--------:|-----------:|
|Single           |  2503|     2503|        29.1|
|Small (2-5)      |  1072|     3008|        35.0|
|Medium (6-20)    |   217|     2049|        23.9|
|Commercial (21+) |    22|     1030|        12.0|

### Host listings count: calculated vs host (per brief)
| n_listings| both_known| counts_match| counts_differ| max_abs_diff|
|----------:|----------:|------------:|-------------:|------------:|
|      16840|      16833|        11926|          4907|         1621|

### Top 15 neighbourhoods
|neighbourhood_cleansed |    n|
|:----------------------|----:|
|Cannaregio             | 3094|
|Castello               | 3046|
|San Marco              | 1859|
|Piave 1860             | 1669|
|Dorsoduro              | 1303|
|San Polo               | 1198|
|Santa Croce            | 1135|
|Lido                   |  665|
|San Lorenzo XXV Aprile |  434|
|Marghera               |  354|
|Giudecca               |  294|
|Carpenedo              |  183|
|Murano                 |  174|
|Bissuola               |  120|
|Alberoni               |  111|

## Reviews
- Total (after dedup): **859691**
  - June scrape: 800232
  - September scrape: 841518
  - Duplicates removed (in both scrapes): 782059
- Date range: 2010-05-24 to 2025-09-10
