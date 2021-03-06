
# qEnviron <img src="man/figures/qenviron_hexlogo.png" align="right" width="220"/>

<!-- badges: start -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
![GitHub release (latest by
date)](https://img.shields.io/github/v/release/globalgov/qEnviron)
![GitHub Release
Date](https://img.shields.io/github/release-date/globalgov/qEnviron)
<!-- badges: end -->

qEnviron is the second qPackage in the
[qData](https://github.com/globalgov/qData) ecosystem. It currently
includes an ensemble of datasets on international environmental
agreements, and [states](https://github.com/globalgov/qStates)’
membership or other relationships to those agreements.

## How to install

We’ve made it easier than ever to install and start analysing global
governance data in R. Simply install the core package,
[qData](https://github.com/globalgov/qData), as follows, and then you
can discover, install and update various qPackages from the console.

``` r
# install.packages(remotes)
remotes::install_github("globalgov/qData") # this installs our core package, the only one you need to do independently
qData::get_packages() # this prints a list of the publicly available data packages currently available
qData::get_packages("qStates") # this downloads and installs the named package
```

## Data included

Once you have installed the package, you can see the different databases
and datasets include in the package using the following function.

``` r
qData::report_data("qEnviron")
```

    ##        Unique ID Rows Columns Beg          End          URL 
    ## IEADB  3666      3666 3       "NA"         "NA"         NULL
    ## GNEVAR 2733      2733 4       "NA"         "NA"         NULL
    ## ECOLEX 2174      2174 3       "1868-10-17" "2018-03-04" NULL
    ##        Reference                                                                                                        
    ## IEADB  "Mitchell RB, Andonova LB, Axelrod M, Balsiger J, Bernauer T, Green JF,Hollway J, Kim RE, Morin J (2" [truncated]
    ## GNEVAR "Hollway J, Koskinen J (2016). "Multilevel embeddedness: The case of theglobal fisheries governance " [truncated]
    ## ECOLEX "Sommer J (2020). "Global governance in forestry: a cross-nationalanalysis." _International Journal " [truncated]

Working with ensembles of related data has many advantages for robust
analysis. Just take a look at our vignettes
[here](https://globalgov.github.io/qData/articles/user.html).

While some qPackages can and do include novel data, much of what they
offer involves standing on the shoulders of giants. qPackages endeavour
to be as transparent as possible about where data comes from, how it has
been coded and/or relabelled, and who has done the work. As such, we
make it easy to cite both the particular datasets you use by listing the
official references in the function above, as well as the package
providers for their work assembling the data using the function below.

``` r
citation("qEnviron")
```

    ## 
    ## To cite package 'qEnviron' in publications use:
    ## 
    ##   James Hollway (2021). qEnviron: Environmental agreements for qData. R
    ##   package version 0.0.1.
    ## 
    ## A BibTeX entry for LaTeX users is
    ## 
    ##   @Manual{,
    ##     title = {qEnviron: Environmental agreements for qData},
    ##     author = {James Hollway},
    ##     year = {2021},
    ##     note = {R package version 0.0.1},
    ##   }

## Contributing

[qData](https://github.com/globalgov/qData) also makes it easy to
contribute in lots of different ways.

If you have already developed a dataset salient to this package, please
reach out by flagging this as an
[issue](https://github.com/globalgov/qEnviron/issues) for us, or by
forking, further developing the package yourself, and opening a [pull
request](https://github.com/globalgov/qEnviron/pulls) so that your data
can be used easily.

If you have collected or developed other data that may not be best for
this package, but could be useful within the wider ecosystem,
[qData](https://github.com/globalgov/qData) includes a number of
functions that make it easy to create a new qPackage and populate with
clean, consistent global governance data.

If you have any other ideas about how this package or the qData
ecosystem more broadly might better facilitate your empirical analysis,
we’d be very happy to hear from you.
