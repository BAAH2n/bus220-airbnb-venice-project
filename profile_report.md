# Data Profile Report — Venice Airbnb
_Generated: 2026-04-28 15:41_

## Listings
- Rows total: **25090**
  - June scrape: 8250
  - September scrape: 16840
- Unique listings (`id`): 9050
- Unique hosts (`host_id`): 3920

### Scrape overlap
# A tibble: 3 × 3
  appears_in n_listings label      
       <int>      <int> <chr>      
1          1        809 in one only
2          2        442 in both    
3          3       7799 in one only

### Price distribution after cleaning
# A tibble: 1 × 9
  n_with_price   min   p25 median  mean   p75   p95   p99   max
         <int> <dbl> <dbl>  <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
1        22224    10   111    155  233.   224   500  1195 14264

### NULL-rates (% null) for key fields
# A tibble: 14 × 2
   field                        pct_null
   <chr>                           <dbl>
 1 calendar_updated                100  
 2 price                            11.4
 3 estimated_revenue_l365d          11.4
 4 host_response_rate               11  
 5 review_scores_rating              9  
 6 review_scores_cleanliness         9  
 7 review_scores_location            9  
 8 host_acceptance_rate              5.8
 9 license                           5.7
10 bathrooms_text                    0.1
11 estimated_occupancy_l365d         0  
12 neighbourhood_cleansed            0  
13 neighbourhood_group_cleansed      0  
14 source                            0  

### By room type
# A tibble: 4 × 2
  room_type           n
  <chr>           <int>
1 Entire home/apt 19543
2 Private room     5247
3 Hotel room        264
4 Shared room        36

### By source (carry-over vs new)
# A tibble: 2 × 2
  source              n
  <chr>           <int>
1 city scrape     22231
2 previous scrape  2859

### Host listings count: calculated vs host (per brief)
# A tibble: 1 × 5
  n_listings both_known counts_match counts_differ max_abs_diff
       <int>      <int>        <int>         <int>        <dbl>
1      25090      25081        17474          7607         1621

### Top 15 neighbourhoods
# A tibble: 15 × 2
   neighbourhood_cleansed     n
   <chr>                  <int>
 1 Cannaregio              4622
 2 Castello                4538
 3 San Marco               2775
 4 Piave 1860              2476
 5 Dorsoduro               1941
 6 San Polo                1792
 7 Santa Croce             1700
 8 Lido                     989
 9 San Lorenzo XXV Aprile   653
10 Marghera                 516
11 Giudecca                 419
12 Carpenedo                274
13 Murano                   258
14 Bissuola                 179
15 Alberoni                 167

## Reviews
- Total (after dedup): **859691**
  - June scrape: 800232
  - September scrape: 841518
  - Duplicates removed (in both scrapes): 782059
- Date range: 2010-05-24 to 2025-09-10
