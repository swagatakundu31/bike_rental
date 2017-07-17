# https://cran.r-project.org/web/packages/rnoaa/rnoaa.pdf
#sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu zesty/" >> /etc/apt/sources.list'
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
#sudo apt-get update
#sudo apt-get install r-base-dev
# sudo apt-get install libcurl4-openssl-dev
# sudo apt-get install libcurl4-openssl-dev r-base-dev libxml2-dev
# sudo apt-get install libssl-dev
# Email:	ritesh.malaiya@gmail.com
# Token:	KXyxkpHUUIJHnClEPACdkSzxfGoiDSTU
# https://www.ncdc.noaa.gov/data-access/land-based-station-data/land-based-datasets/global-historical-climatology-network-ghcn


install.packages("rnoaa")
library('plyr')
library('rnoaa')
options(noaakey = "KXyxkpHUUIJHnClEPACdkSzxfGoiDSTU")
rnoaa::ncdc_stations(datasetid='GHCND', locationid='FIPS:12017', stationid='GHCND:USC00084289')
out <- rnoaa::ncdc(datasetid='NORMAL_DLY', stationid='GHCND:USW00014895', datatypeid='dly-tmax-normal', startdate = '2010-05-01', enddate = '2010-05-10')
head( out$data )
