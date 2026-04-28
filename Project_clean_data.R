listings_sep <- read_csv("listings_sep.csv") 

listings_sep <-  listings_sep |> 
  mutate(listing_file = "September") |> 
  mutate(host_response_rate = str_remove(host_response_rate, "%"),
         host_acceptance_rate = str_remove(host_acceptance_rate, "%"),
         host_response_rate = as.double(na_if(host_response_rate, "N/A")),
         host_acceptance_rate = as.double(na_if(host_acceptance_rate, "N/A")),
         price = str_remove(price, "^\\$"),
         price = as.double(str_remove(price, ","))) 


listings_june <- read_csv("listings_june.csv") 

listings_june <-  listings_june |> 
  mutate(listing_file = "Jne") |> 
  mutate(host_response_rate = str_remove(host_response_rate, "%"),
         host_acceptance_rate = str_remove(host_acceptance_rate, "%"),
         host_response_rate = as.double(na_if(host_response_rate, "N/A")),
         host_acceptance_rate = as.double(na_if(host_acceptance_rate, "N/A")),
         price = str_remove(price, "^\\$"),
         price = as.double(str_remove(price, ",")))


listings <- listings_sep |> 
  union_all(listings_june)

write_csv(listings, "listings.csv", na = "")
