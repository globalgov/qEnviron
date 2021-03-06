# TFDD_MEM Preparation Script

# This is a template for importing, cleaning, and exporting data
# ready for the qPackage.
library(qData)

# Stage one: Collecting data
TFDD_MEM <- readxl::read_excel("data-raw/memberships/TFDD_MEM/TFDD.xlsx")

# Stage two: Correcting data
# In this stage you will want to correct the variable names and
# formats of the 'TFDD_MEM' object until the object created
# below (in stage three) passes all the tests.
TFDD_MEM <- as_tibble(TFDD_MEM) %>%
  dplyr::mutate(signature = openxlsx::convertToDate(TFDD_MEM$DateSigned)) %>% 
  dplyr::mutate(sign = as.character(signature)) %>% 
  dplyr::mutate(Signature1 = dplyr::coalesce(sign, DateSigned)) %>% 
  transmutate(TFDD_ID = `2016Update ID`,
              Country = CCODE,
              Title = standardise_titles(DocumentName),
              Signature = standardise_dates(Signature1)) %>%
  dplyr::select(TFDD_ID, Country, Title, Signature) %>% 
  dplyr::arrange(Signature)

# qData includes several functions that should help cleaning
# and standardising your data.
# Please see the vignettes or website for more details.

# Stage three: Connecting data
# Next run the following line to make TFDD_MEM available within the qPackage.
export_data(TFDD_MEM, database = "memberships", URL = "https://transboundarywaters.science.oregonstate.edu/")
# This function also does two additional things.
# First, it creates a set of tests for this object to ensure adherence
# to certain standards.You can hit Cmd-Shift-T (Mac) or Ctrl-Shift-T (Windows)
# to run these tests locally at any point.
# Any test failures should be pretty self-explanatory and may require
# you to return to stage two and further clean, standardise, or wrangle
# your data into the expected format.
# Second, it also creates a documentation file for you to fill in.
# Please make sure that you cite any sources appropriately and fill in as
# much detail about the variables etc as possible.
