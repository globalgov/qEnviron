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
  rename(Signa = Signature) %>% 
  transmutate(ID = Country,
              GNEVAR_ID = GENG,
              Signature = standardise_dates(Signa),
              Rat = standardise_dates(Approval),
              Withdrawal = standardise_dates(Withdrawal1),
              Begg = standardise_dates(DocSign),
              Force = standardise_dates(DocForce), 
              Endd = standardise_dates(DocEnd),
              Force1 = standardise_dates(InForce1)) %>% 
  dplyr::select(ID, GNEVAR_ID, Title, Begg, Endd, Withdrawal, Signature, Rat, Force, Force1) %>% 
  dplyr::mutate(Beg = coalesce(Signature, Rat, Force1)) %>% 
  dplyr::mutate(End = coalesce(Withdrawal, Endd)) %>% 
  dplyr::select(ID, GNEVAR_ID, Title, Beg, End) %>% 
  dplyr::arrange(Beg, ID)
  
# qData includes several functions that should help cleaning and standardising your data.
# Please see the vignettes or website for more details.

# Stage three: Connecting data
# Next run the following line to make GNEVAR_MEM available within the qPackage.
export_data(GNEVAR_MEM, database = "memberships", link = "https://github.com/jhollway/gnevar")
# This function also does two additional things.
# First, it creates a set of tests for this object to ensure adherence to certain standards.
# You can hit Cmd-Shift-T (Mac) or Ctrl-Shift-T (Windows) to run these tests locally at any point.
# Any test failures should be pretty self-explanatory and may require you to return
# to stage two and further clean, standardise, or wrangle your data into the expected format.
# Second, it also creates a documentation file for you to fill in.
# Please make sure that you cite any sources appropriately and fill in as much detail
# about the variables etc as possible.