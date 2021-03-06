# CIESIN Preparation Script

# This is a template for importing, cleaning, and exporting data
# ready for the qPackage.
library(qData)

# Stage one: Collecting data
CIESIN <- readxl::read_excel("data-raw/agreements/CIESIN/CIESIN.xls")

# Stage two: Correcting data
# In this stage you will want to correct the variable names and
# formats of the 'CIESIN' object until the object created
# below (in stage three) passes all the tests.
CIESIN <- as_tibble(CIESIN) %>%
  transmutate(Title = standardise_titles(`Treaty Title`),
              Beg = standardise_dates(`Year of Agreement`), # standardise_dates do not take into account range date yet
              Force = standardise_dates(`Year of Entry into Force`)) %>% # Same for this variable
  dplyr::select(Title, Beg) %>% 
  dplyr::arrange(Beg, Title)
# qData includes several functions that should help cleaning
# and standardising your data.
# Please see the vignettes or website for more details.

# Stage three: Connecting data
# Next run the following line to make CIESIN available within the qPackage.

# export_data(CIESIN, database = "agreements", URL = "https://sedac.ciesin.columbia.edu/entri/") 
# can not export yet as standardise_dates() do not function on dates range

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
