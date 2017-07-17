data = X2011_Q1_cabi_trip_history_data

#install.packages("qdapRegex")
library(qdapRegex)


# to extract station number from street address, we used gsub()
data$St_Stationnumber = gsub("[\\(\\)]", "", regmatches(data$Startstation, gregexpr("\\(.*?\\)", data$Startstation)))
data$End_Stationnumber = gsub("[\\(\\)]", "", regmatches(data$Endstation, gregexpr("\\(.*?\\)", data$Endstation)))

write.csv(data, file = "2011Q1_location.csv")

min(data$St_Stationnumber)
max(data$St_Stationnumber)

min(data$End_Stationnumber)
max(data$End_Stationnumber)
str(data)
#data$St_Stationnumber = as.numeric(data$St_Stationnumber)
#data$End_Stationnumber = as.numeric(data$End_Stationnumber)


#sum(is.na(data$End_Stationnumber)) # 11 NA's in this column
#sum(is.na(data$St_Stationnumber)) # 0 NA's in this column

x = Capital_Bike_Share_Locations

#install.packages("ggplot2")
library(ggplot2)
#install.packages("ggmap")
library(ggmap)

#x = x[,-c(7:16)]
  
#location = do.call(rbind,
                  # lapply(1:nrow(x),
                          #function(i)revgeocode(as.numeric(x[i,6:5]))))



#x = cbind(x,location)

#install.packages("stringr")
#library(stringr)
#x$zipcode <- substr(str_extract(x$location," [0-9]{5}, .+"),2,6)

#write.csv(x, file = "new_bikelocation.csv")


#install.packages("rwunderground")
#library(rwunderground)


colnames(data)
colnames(new_bikelocation)

pubhol = Publicholidays_2011_2012

#install.packages("Rsqlite")
library(RSQLite)


con = dbConnect(RSQLite::SQLite(), dbname = "Bike_Triphistory_data")

dbWriteTable(con, name = "Trip_History", value = "2011-Q1-cabi-trip-history-data.csv", 
             row.names = FALSE, header = TRUE, sep = ",")

dbWriteTable(con, name = "Station_terminal_zipcode", value = new_bikelocation,
             row.names = FALSE, header = TRUE, sep = ",")

dbWriteTable(con,name = "Public_Holidays", value = Publicholidays_2011_2012, 
             row.names = FALSE, header = TRUE, sep = ",")

?dbWriteTable

new_data = dbGetQuery(con,"SELECT data.MemberType, data.Startdate,  data.St_Stationnumber , 
                     new_bikelocation.zipcode as 'st_zipcode', data.Enddate, data.End_Stationumber, 
                     x.zipcode as 'end_zipcode' , data.Duration , data.Bike_ID
                    
                   FROM data, new_bikelocation, new_bikelocation as x, pubhol
              
                   WHERE data.St_Stationnumber = new_bikelocation.TERMINAL_NUMBER
              
                   AND   data.End_Stationnumber = x.TERMINAL_NUMBER
                   AND     " )



