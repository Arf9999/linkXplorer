
<!-- README.md is generated from README.Rmd. Please edit that file -->

# linkXtractor

<!-- badges: start -->
<!-- badges: end -->

The goal of linkXtractor is to build a tibble of links from a source
webpage URL.

## Installation

You can install development version from [GitHub](https://github.com/)
with:

``` r
# install.packages("devtools")
devtools::install_github("Arf9999/linkXtractor")
```

## Example

This is a basic example:

``` r
library(linkXtractor)
example <- linkXtractor::get_links("https://cnn.com/")
head(example, 10)
#> # A tibble: 10 x 2
#>    source_url       out_link                                                    
#>    <chr>            <chr>                                                       
#>  1 https://cnn.com/ https://edition.cnn.com/                                    
#>  2 https://cnn.com/ https://www.cnn.com/                                        
#>  3 https://cnn.com/ https://plus.google.com/+cnn/posts                          
#>  4 https://cnn.com/ android-app://com.cnn.mobile.android.phone/http/edition.cnn…
#>  5 https://cnn.com/ https://edition.cnn.com/world                               
#>  6 https://cnn.com/ https://edition.cnn.com/politics                            
#>  7 https://cnn.com/ https://edition.cnn.com/business                            
#>  8 https://cnn.com/ https://edition.cnn.com/health                              
#>  9 https://cnn.com/ https://edition.cnn.com/entertainment                       
#> 10 https://cnn.com/ https://edition.cnn.com/style
## basic example code
```
