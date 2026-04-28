# Data Profile Report — Venice Airbnb
_Generated: 2026-04-28 16:02_

## Listings
- Rows total: **25090**
  - June scrape: 8250
  - September scrape: 16840
- Unique listings (`id`): 9050
- Unique hosts (`host_id`): 3920

### Scrape overlap
| appears_in| n_listings|label       |
|----------:|----------:|:-----------|
|          1|        809|in one only |
|          2|        442|in both     |
|          3|       7799|in one only |

### Price distribution after cleaning
| n_with_price| min| p25| median|     mean| p75| p95|  p99|   max|
|------------:|---:|---:|------:|--------:|---:|---:|----:|-----:|
|        22224|  10| 111|    155| 232.8427| 224| 500| 1195| 14264|

### NULL-rates (% null) for key fields
|field                        | pct_null|
|:----------------------------|--------:|
|calendar_updated             |    100.0|
|price                        |     11.4|
|estimated_revenue_l365d      |     11.4|
|host_response_rate           |     11.0|
|review_scores_rating         |      9.0|
|review_scores_cleanliness    |      9.0|
|review_scores_location       |      9.0|
|host_acceptance_rate         |      5.8|
|license                      |      5.7|
|bathrooms_text               |      0.1|
|estimated_occupancy_l365d    |      0.0|
|neighbourhood_cleansed       |      0.0|
|neighbourhood_group_cleansed |      0.0|
|source                       |      0.0|

### By room type
|room_type       |     n|
|:---------------|-----:|
|Entire home/apt | 19543|
|Private room    |  5247|
|Hotel room      |   264|
|Shared room     |    36|

### By source (carry-over vs new)
|source          |     n|
|:---------------|-----:|
|city scrape     | 22231|
|previous scrape |  2859|

### Host listings count: calculated vs host (per brief)
| n_listings| both_known| counts_match| counts_differ| max_abs_diff|
|----------:|----------:|------------:|-------------:|------------:|
|      25090|      25081|        17474|          7607|         1621|

### Top 15 neighbourhoods
|neighbourhood_cleansed |    n|
|:----------------------|----:|
|Cannaregio             | 4622|
|Castello               | 4538|
|San Marco              | 2775|
|Piave 1860             | 2476|
|Dorsoduro              | 1941|
|San Polo               | 1792|
|Santa Croce            | 1700|
|Lido                   |  989|
|San Lorenzo XXV Aprile |  653|
|Marghera               |  516|
|Giudecca               |  419|
|Carpenedo              |  274|
|Murano                 |  258|
|Bissuola               |  179|
|Alberoni               |  167|

## Reviews
- Total (after dedup): **859691**
  - June scrape: 800232
  - September scrape: 841518
  - Duplicates removed (in both scrapes): 782059
- Date range: 2010-05-24 to 2025-09-10
