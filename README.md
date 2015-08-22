<!-- README.md is generated from README.Rmd. Please edit that file -->
![](honeypot.png)

mhn is an R package to interface with the MHN API and (eventually) provide tools to analyze and visualize MHN data.

The API wrapper functions in this package all rely on a MHN server API key residing in the environment variable `MHN_API_KEY` or being passed in as a parameter. The former is useful in simple deplpoyments where there is only one MHN server. In such cases, the easiest way to accomplish this is to set it in the `.Renviron` file in your home directory.

This package pairs nicely with:

-   [iptools](https://github.com/hrbrmstr/iptools)
-   [urltools](https://github.com/Ironholds/urltools)
-   [cymruservices](https://github.com/hrbrmstr/cymruservices)
-   [shodan](https://github.com/hrbrmstr/shodan)
-   [rgeolocate](https://github.com/Ironholds/rgeolocate)
-   [whoisxmlapi](https://github.com/hrbrmstr/whoisxmlapi)
-   [domaintools](https://github.com/hrbrmstr/domaintools)
-   [whoapi](https://github.com/Ironholds/whoapi)

The following functions are implemented:

-   `attacker_stats`: Get attacker (IP) statistics
-   `feed_info`: Get data for a specific hpfeed
-   `hp_feeds`: Getthe raw hpfeeds data collected over a specific channel.
-   `intel_feed`: Get intel feed
-   `mhn_api_key`: Get or set `MHN_API_KEY` value
-   `sensors`: Get sensors.
-   `sessions`: Get normalized sessions/connection data
-   `session_info`: Get data for a specific attack session
-   `top_attackers`: Get top attackers
-   `mhn_dork`: MHN dork *(I have no idea what this is tho)*
-   `mhn_file`: MHN file *(I have no idea what this is tho)*
-   `mhn_url`: MHN url *(I have no idea what this is tho)*

### News

-   Version 0.0.0.9000 released

### Installation

``` r
devtools::install_github("hrbrmstr/mhn")
```

### Usage

``` r
library(mhn)

# current verison
packageVersion("mhn")
#> [1] '0.0.0.9000'
```

### Test Results

``` r
library(mhn)
library(testthat)

date()
#> [1] "Sat Aug 22 09:50:31 2015"

test_dir("tests/")
#> testthat results ========================================================================================================
#> OK: 0 SKIPPED: 0 FAILED: 0
#> 
#> DONE
```

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
