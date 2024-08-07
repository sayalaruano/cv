# This script builds both the HTML and PDF versions of your CV

# If you want to speed up rendering for googlesheets driven CVs you can cache a
# version of your data This avoids having to fetch from google sheets twice and
# will speed up rendering. It will also make things nicer if you have a
# non-public sheet and want to take care of the authentication in an interactive
# mode.
# To use, simply uncomment the following lines and run them once.
# If you need to update your data delete the "ddcv_cache.rds" file and re-run

library(tidyverse)
library(pagedown)
source("CV_printing_functions.R")
cv_data <- create_CV_object(
  data_location = "https://docs.google.com/spreadsheets/d/16P_CAcWlMUKXJK-q7-Z7aMA8MQVHG9viP2nd5JxPu2c/edit?usp=sharing",
  cache_data = FALSE
)

readr::write_rds(cv_data, 'cached_positions.rds')
cache_data <- TRUE

# Knit the HTML version
rmarkdown::render("sayalaruano_cv.Rmd",
                  params = list(pdf_mode = FALSE, cache_data = cache_data),
                  output_file = "index.html")


# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("sayalaruano_cv.Rmd",
                  params = list(pdf_mode = TRUE, cache_data = cache_data),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = "sayalaruano_cv.pdf")
