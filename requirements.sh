# Use this file to install Linux software packages into the course image.
# R packages should be installed from requirements.R
# DataCamp runs Ubuntu Xenial. There is a list of available packages at 
# https://packages.ubuntu.com
# This file needs to run without interaction. You may need to use some of these args to apt-get:
# --assume-yes --assume-no --trivial-only --allow-downgrades --allow-remove-essential --allow-change-held-packages

# XML, for https://cran.r-project.org/web/packages/XML and https://cran.r-project.org/web/packages/xml2/index.html
# apt-get update && apt-get install --yes libxml2-dev

# Curl, for https://cran.r-project.org/web/packages/RCurl and https://cran.r-project.org/web/packages/curl
# apt-get update && apt-get install --yes libcurl4-openssl-dev

# V8, for https://cran.r-project.org/web/packages/V8
# apt-get update && apt-get install --yes libv8-3.14-dev

# Protocol buffers, for https://cran.r-project.org/web/packages/RProtoBuf
# apt-get update && apt-get install --yes libprotobuf-dev protobuf-compiler

# jq JSON processor, for https://cran.r-project.org/web/packages/jqr (needs additional repo)
# add-apt-repository -y ppa:opencpu/jq
# apt-get update && apt-get install --yes libjq-dev

## SSL, for https://cran.r-project.org/web/packages/openssl
# apt-get update && apt-get install --yes libssl-dev

# Cairo, for https://cran.r-project.org/web/packages/Cairo
# apt-get update && apt-get install --yes libcairo2-dev

## GNU Scientific Library, for https://cran.r-project.org/web/packages/topicmodels
# apt-get update && apt-get install --yes libgsl-dev

## Poppler PDF renderer, for https://cran.r-project.org/web/packages/pdftools
# apt-get update && apt-get install --yes libpoppler-cpp-dev

## ImageMagick, for https://cran.r-project.org/web/packages/magick (needs additional repo)
# sudo add-apt-repository -y ppa:opencpu/imagemagick
# apt-get update && apt-get install --yes libmagick++-dev

# Most spatial things below need GIS repo
# add-apt-repository --yes ppa:ubuntugis/ubuntugis-unstable

# GDAL and PROJ.4, for https://cran.r-project.org/web/packages/rgdal
# apt-get update && apt-get install --yes libgdal-dev  libproj-dev 

# udunits, for https://cran.r-project.org/web/packages/udunits2
# apt-get update && apt-get install --yes libudunits2-dev

# GEOS, for https://cran.r-project.org/web/packages/rgeos
# apt-get update && apt-get install --yes libgeos-dev

# Some spatial stuff also needs this
# apt-get update && apt-get install --yes liblwgeom-dev
