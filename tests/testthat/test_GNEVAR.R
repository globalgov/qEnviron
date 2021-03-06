# Test if  meets the q ecosystem requirements

# Report missing values
test_that("missing observations are reported correctly", {
  expect_false(any(grepl("\\?", agreements[["GNEVAR"]])))
  expect_false(any(grepl("^n/a$", agreements[["GNEVAR"]])))
  expect_false(any(grepl("^N/A$", agreements[["GNEVAR"]])))
  expect_false(any(grepl("^\\s$", agreements[["GNEVAR"]])))
  expect_false(any(grepl("^\\.$", agreements[["GNEVAR"]])))
  expect_false(any(grepl("N\\.A\\.$", agreements[["GNEVAR"]])))
  expect_false(any(grepl("n\\.a\\.$", agreements[["GNEVAR"]])))
})

# Uniformity tests (agreements have a source ID, a string title, a signature and
# entry into force date)
test_that("datasets have the required variables", {
  expect_col_exists(agreements[["GNEVAR"]], vars(Title))
  expect_col_exists(agreements[["GNEVAR"]], vars(Beg))
  expect_true(any(grepl("_ID$", colnames(agreements[["GNEVAR"]]))))
  expect_col_exists(agreements[["GNEVAR"]], vars(Signature))
  expect_col_exists(agreements[["GNEVAR"]], vars(Force))
})

# Dates are standardized for mandatory column
test_that("Column `Beg` has standardised dates", {
  expect_col_is_date(agreements[["GNEVAR"]], vars(Beg))
  expect_false(any(grepl("/", agreements[["GNEVAR"]]$Beg)))
  expect_false(any(grepl("^[:digit:]{2}-[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$Beg)))
  expect_false(any(grepl("^[:digit:]{1}-[:digit:]{1}-[:digit:]{4}$", agreements[["GNEVAR"]]$Beg)))
  expect_false(any(grepl("^[:digit:]{2}-[:digit:]{1}-[:digit:]{4}$", agreements[["GNEVAR"]]$Beg)))
  expect_false(any(grepl("^[:digit:]{1}-[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$Beg)))
  expect_false(any(grepl("^[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$Beg)))
  expect_false(any(grepl("^[:alpha:]$", agreements[["GNEVAR"]]$Beg)))
})

test_that("Column `Signature` has standardised dates", {
  expect_col_is_date(agreements[["GNEVAR"]], vars(Signature))
  expect_false(any(grepl("/", agreements[["GNEVAR"]]$Signature)))
  expect_false(any(grepl("^[:digit:]{2}-[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$Signature)))
  expect_false(any(grepl("^[:digit:]{1}-[:digit:]{1}-[:digit:]{4}$", agreements[["GNEVAR"]]$Signature)))
  expect_false(any(grepl("^[:digit:]{2}-[:digit:]{1}-[:digit:]{4}$", agreements[["GNEVAR"]]$Signature)))
  expect_false(any(grepl("^[:digit:]{1}-[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$Signature)))
  expect_false(any(grepl("^[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$Signature)))
  expect_false(any(grepl("^[:alpha:]$", agreements[["GNEVAR"]]$Signature)))
})

test_that("Column `Force` has standardised dates", {
  expect_col_is_date(agreements[["GNEVAR"]], vars(Force))
  expect_false(any(grepl("/", agreements[["GNEVAR"]]$Force)))
  expect_false(any(grepl("^[:digit:]{2}-[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$Force)))
  expect_false(any(grepl("^[:digit:]{1}-[:digit:]{1}-[:digit:]{4}$", agreements[["GNEVAR"]]$Force)))
  expect_false(any(grepl("^[:digit:]{2}-[:digit:]{1}-[:digit:]{4}$", agreements[["GNEVAR"]]$Force)))
  expect_false(any(grepl("^[:digit:]{1}-[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$Force)))
  expect_false(any(grepl("^[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$Force)))
  expect_false(any(grepl("^[:alpha:]$", agreements[["GNEVAR"]]$Force)))
})

# Dates are standardized for optional columns
test_that("Columns with dates are standardized", {
  if(!is.null(agreements[["GNEVAR"]]$End)) {
    expect_false(any(grepl("/", agreements[["GNEVAR"]]$End)))
    expect_false(any(grepl("^[:digit:]{2}-[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$End)))
    expect_false(any(grepl("^[:digit:]{1}-[:digit:]{1}-[:digit:]{4}$", agreements[["GNEVAR"]]$End)))
    expect_false(any(grepl("^[:digit:]{2}-[:digit:]{1}-[:digit:]{4}$", agreements[["GNEVAR"]]$End)))
    expect_false(any(grepl("^[:digit:]{1}-[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$End)))
    expect_false(any(grepl("^[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$End)))
    expect_false(any(grepl("^[:alpha:]$", agreements[["GNEVAR"]]$End)))
  }
  if (!is.null(agreements[["GNEVAR"]]$Rat)) {
    expect_false(any(grepl("/", agreements[["GNEVAR"]]$Rat)))
    expect_false(any(grepl("^[:digit:]{2}-[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$Rat)))
    expect_false(any(grepl("^[:digit:]{1}-[:digit:]{1}-[:digit:]{4}$", agreements[["GNEVAR"]]$Rat)))
    expect_false(any(grepl("^[:digit:]{2}-[:digit:]{1}-[:digit:]{4}$", agreements[["GNEVAR"]]$Rat)))
    expect_false(any(grepl("^[:digit:]{1}-[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$Rat)))
    expect_false(any(grepl("^[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$Rat)))
    expect_false(any(grepl("^[:alpha:]$", agreements[["GNEVAR"]]$Rat)))
  }
  if (!is.null(agreements[["GNEVAR"]]$Term)) {
    expect_false(any(grepl("/", agreements[["GNEVAR"]]$Term)))
    expect_false(any(grepl("^[:digit:]{2}-[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$Term)))
    expect_false(any(grepl("^[:digit:]{1}-[:digit:]{1}-[:digit:]{4}$", agreements[["GNEVAR"]]$Term)))
    expect_false(any(grepl("^[:digit:]{2}-[:digit:]{1}-[:digit:]{4}$", agreements[["GNEVAR"]]$Term)))
    expect_false(any(grepl("^[:digit:]{1}-[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$Term)))
    expect_false(any(grepl("^[:digit:]{2}-[:digit:]{4}$", agreements[["GNEVAR"]]$Term)))
    expect_false(any(grepl("^[:alpha:]$", agreements[["GNEVAR"]]$Term)))
  }
})
