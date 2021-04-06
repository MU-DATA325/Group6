# Group6

Capital Bikeshare 

7 Cities w/ data:
Washington
Boston
Los Angeles 
New York
Chicago
Philadelphia
San Francisco

We can compare and contrast the Bikeshare data between each country by looking at different variables offered:

Usage differences per major city
Start times/Stop times
User Type (single trip/day pass, member (annual or monthly)
Gender (self reported)
Most used locations in each city 
Distance
Time

Can base the research question off of the theory above


```{r}
library(readr)
metro_trips_2020_q4 <- read_csv("metro-trips-2020-q4.csv")
View(metro_trips_2020_q4)
```


#Section 1 Introduction: 

The idea of Bikeshare was created in Amsterdam, Netherlands in 1965 and didn't come to the United States until much later. Portland Oregon in 1994 adopted the first community bike project in the United States, but they really are only active in major cities. 
Currently they are being used in major cities, privately, and in universities for a cheaper more sustainable way to transport oneself. 

Data can be directly extrapolated from the Bikeshare portal on seven major metropolitan cities. It has been collected through member surveys, as well as documentation through apps when the information is taken by recipients electronically.
Data was initially processed to track the system as well as remove trips that are taken by staff as they service or inspect the system. Also has a development plan survey every few years to assess usage trends and plans.

Data has been collected through member surveys, as well as documentation through apps when the information is taken by recipients electronically. 
Data was initially processed to track the system as well as remove trips that are taken by staff as they service or inspect the system. Also has a development plan survey every few years to assess usage trends and plans. 

The data is gauged in pertinence to evaluating the average BikeShare usage in major cities as a means to elucidate upon  future models in respect to subjective time-intervals. Through evaluating various subsets pertaining to the 7 recorded cities, we can build predictive models based on subjective attributes that lend to a wider propensity of BikeShare usage. Thus, the research question serves as a precursor in gaining insight to not just building optimal models based on longevity, but also factors for maintenance, trends, etc.
 

#Section 2 Data: 

So once we find the data we want to use we just have to import it to Github which will then allow us to bring it into Rstudio 

#Section 3: Data Analysis Plan:

We need to have 1 singular response variable y and we can have as many explanatory variables x as we want. So just have to divide that up.

-Our response variable will be based on passes, distance of bikeshare intervals per city

Data variables:
- Trip start day and time
- Trip end day and time
- User Type (single trip/day pass, member (annual or monthly)
- Gender (self reported)
- Most used locations in each city
- Distance

-the comparison groups: other bike companies? 

- 

- the method(s) we will be using to answer our research questions will be experiments, surveys, interviews, and observations
