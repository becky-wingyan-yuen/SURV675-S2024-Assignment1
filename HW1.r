
rm(list=ls())

library(readr)

urlfile = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/UID_ISO_FIPS_LookUp_Table.csv"
urlfile1 = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"

UID_ISO_FIPS_LookUp_Table = read_csv(url(urlfile))
time_series_covid19_confirmed_global = read_csv(url(urlfile1))

names(UID_ISO_FIPS_LookUp_Table)[which(names(UID_ISO_FIPS_LookUp_Table)=="Long_")] = "Long"
names(time_series_covid19_confirmed_global)[which(names(time_series_covid19_confirmed_global)=="Province/State")] = "Province_State"
names(time_series_covid19_confirmed_global)[which(names(time_series_covid19_confirmed_global)=="Country/Region")] = "Country_Region"

save(UID_ISO_FIPS_LookUp_Table, file = "UID_ISO_FIPS_LookUp_Table.csv")
save(time_series_covid19_confirmed_global, file = "time_series_covid19_confirmed_global.csv")

All_data = merge(time_series_covid19_confirmed_global, UID_ISO_FIPS_LookUp_Table, by = c("Province_State","Country_Region","Lat","Long"))

All_data_long = reshape(data = All_data,
				 idvar= "UID",
				 varying = names(All_data)[5:1147], #We need to specify here the columns to be reshaped
				 v.names = "n_case",
				 timevar= "date",
				 times = names(All_data)[5:1147],
				 new.row.names = 1:320040,
				 direction = "long")

save(All_data, file = "All_data_wide.csv")
save(All_data_long, file = "All_data_long.csv")


library(ggplot2)
library(tidyr)
library(dplyr)
library(lubridate, warn.conflicts = FALSE)

names(All_data_long)[which(names(All_data_long)=="date")] = "date_chr"
All_data_long$date = mdy(All_data_long$date_chr)


All_data_long_date = All_data_long %>% 
						group_by(date) %>% 
						summarize(ncase_bydate = sum(n_case)) %>% 
						arrange(date)


graph1 = ggplot(data = All_data_long_date, mapping = aes(x = date, y = log(ncase_bydate)))
(fig1 = graph1 + geom_line() + 
		labs(x = "Date", y = "Number of cases (in log form)", 
		title = "Overall change of number of cases (in log form)"))
ggsave("fig1.jpeg", width = 10, height = 5)

All_data_long_date_country = All_data_long %>% 
						group_by(date, Country_Region) %>% 
						summarize(ncase_bydate = sum(n_case)) %>% 
						arrange(date) 


graph2 = ggplot(data = All_data_long_date_country, mapping = aes(x = date, y = log(ncase_bydate)))
(fig2 = graph2 + geom_line(aes(group = Country_Region)) + 
		labs(x = "Date", y = "Number of cases (in log form)", 
		title = "Change of number of cases (in log form) by Country"))
ggsave("fig2.jpeg", width = 10, height = 5)


graph3 = ggplot(data = All_data_long_date_country, mapping = aes(x = date, y = ncase_bydate/10000))
(fig3 = graph3 + geom_line(aes(group = Country_Region)) + 
		labs(x = "Date", y = "Incident Rate", 
		title = "Change of Incident Rate (cases per 100,000 persons) by Country"))
ggsave("fig3.jpeg", width = 10, height = 5)













