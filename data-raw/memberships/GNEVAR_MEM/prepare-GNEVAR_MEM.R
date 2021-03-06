# GNEVAR_MEM Preparation Script

# This is a template for importing, cleaning, and exporting data
# ready for the qPackage.
library(qData)

# Stage one: Collecting data
GNEVAR_MEM <- readr::read_csv("data-raw/memberships/GNEVAR_MEM/EnvGov Edges-Table 1.csv")

# Stage two: Correcting data
# In this stage you will want to correct the variable names and
# formats of the 'GNEVAR_MEM' object until the object created
# below (in stage three) passes all the tests. 
GNEVAR_MEM <- as_tibble(GNEVAR_MEM) %>%
  transmutate(GNEVAR_ID = GENG,
              Rat = standardise_dates(Approval),
              Withdrawal = standardise_dates(Withdrawal1),
              Signature = standardise_dates(DocSign),
              Force = standardise_dates(DocForce), 
              Term = standardise_dates(DocEnd),
              Force = standardise_dates(InForce1)) %>% 
  dplyr::mutate(SignatureC = standardise_dates(Signature)) %>% 
  dplyr::mutate(Title = standardise_titles(Title)) %>% 
  dplyr::mutate(Beg = dplyr::coalesce(SignatureC, Rat, Force)) %>% 
  dplyr::mutate(End = dplyr::coalesce(Withdrawal, Term)) %>% 
  dplyr::select(GNEVAR_ID, Country, Title, Beg, End, SignatureC, Signature, Rat, Force, Term, Withdrawal) %>% 
  dplyr::arrange(Beg)
  
# qData includes several functions that should help cleaning and standardising your data.
# Please see the vignettes or website for more details.

# Stage three: Connecting data
# Next run the following line to make GNEVAR_MEM available within the qPackage.
export_data(GNEVAR_MEM, database = "memberships", URL = "NA")
# This function also does two additional things.
# First, it creates a set of tests for this object to ensure adherence to certain standards.
# You can hit Cmd-Shift-T (Mac) or Ctrl-Shift-T (Windows) to run these tests locally at any point.
# Any test failures should be pretty self-explanatory and may require you to return
# to stage two and further clean, standardise, or wrangle your data into the expected format.
# Second, it also creates a documentation file for you to fill in.
# Please make sure that you cite any sources appropriately and fill in as much detail
# about the variables etc as possible.