
```{r creating-age-variable-for-September-2020-assigning-it-to-NY20}
NY20 <-NY20 %>% 
  mutate (age = (2020-`birth year`))
```
```{r creating-variable-agegroup-for-September-2020-assigning-it-to-NY20}
NY20 <- NY20 %>% mutate(agegroup = case_when(age >= 61 & age <= 131 ~ '4',
                                             age >= 46  & age <= 60 ~ '3',
                                             age >= 30  & age <= 45 ~ '2',
                                             age >= 16  & age <= 29 ~ '1'))

```
```{r assigning-the-gender-variable-names-September-2020 }
NY20$gender     <- as.factor(NY20$gender)
levels(NY20$gender) <- c("UNKNOWN", "MALE", "FEMALE")
```

```{r glimpse-at-NY20-September-2020}
glimpse(NY20)
```
```{r plotting-the-histogram-of-the-birth-year-for-September-2020}
ggplot(NY20) + geom_histogram(aes(`birth year`)) 
```

```{r calculate-statistics-for-age_category-September-2020}
NY20 %>%  
  summarise(minimum_age=min(age),mean_age=mean(age),median_age=median(age), 
            stdev_age=sd(age))
```


```{r glipse-at-NY20-September-2020 NY20}
glimpse(NY20)
```

```{r number-of-users-by-gender-September-2020 NY20}
NY20 %>%
  count (gender)
```



```{r histogram-for-tripduration-in seconds-September-2020}
NY20$tripduration <- as.integer(NY20$tripduration)
ggplot(NY20) + geom_histogram(aes(tripduration))
```
```{r histogram-adjusted-x-axis-for-tripduration-in seconds-September-2020 }
x.max <- quantile(NY20$tripduration, 0.99)
ggplot(NY20) + geom_histogram(aes(tripduration)) + xlim(c(0, x.max))
```
```{r creating- new-variable-tripduration-in-minutes-September-2020}
NY19  <- mutate(NY20, tripduration.min = tripduration/60)
x.max <- quantile(NY20$tripduration.min, 0.99)
```
```{r defining-tripduration.min-as-integer-September-2020}
NY20$tripduration.min <- as.integer(NY19$tripduration.min)
```

```{r histogram-of-the-tripduration-in minutes-September-2020}
ggplot(NY20) + geom_histogram(aes(tripduration.min, binwidth=2), fill="darkgreen", alpha=0.4) + xlim(c(0, x.max)) + theme_classic()
```

```{r calculate-statistics-for-tripduration-in-minutes-by-gender-September-2020}
NY20 %>%
  group_by(gender) %>%
  summarise(minimum_trdur=min(tripduration.min),mean_trdur=mean(tripduration.min),median_trdur=median(tripduration.min), 
            maximum_trdur=max(tripduration.min))

```


```{r number-of-users-by-gender-September-2020}
NY20 %>%
  count (gender)
```
```{r bar-graph-proportion-of-gender-September-2020 }
ggplot(NY20) + geom_bar(aes(gender, y = (..count..)/sum(..count..)), fill="orange") + ylab("Proportion") + theme_bw()
```
```{r age-distribution-for-male-female-September-2020}
NY20 %>% filter(gender != "UNKNOWN") %>% ggplot(.)  + geom_density(aes(`birth year`,group=gender, fill=gender, colour=gender), adjust=3, alpha=0.1)
```

```{r number-of-users-by-usertype-September-2020 NY20}
NY20 %>%
  count (usertype)
```

<<<<<<< HEAD
```{r bar-graph-count-of-usertypes-September-2020}
ggplot(NY20) + geom_bar(aes(usertype), fill="white", colour="darkblue", width=0.2)
```
```{r bar-graph-proportion-of-usertypes-September-2020}
ggplot(NY20) + geom_bar(aes(usertype, y = (..count..)/sum(..count..)), fill="white", colour="red", width=0.2) + ylab("Proportion")
```
```{r calculate-statistics-for-tripduration-in-minutes-by-agegroup-September-2020}
NY20 %>%
  group_by(agegroup) %>%
  summarise(minimum_trdur=min(tripduration.min),mean_trdur=mean(tripduration.min),median_trdur=median(tripduration.min), 
            maximum_trdur=max(tripduration.min))

```

```{r graph-age-gender-September-2020}
ggplot(NY20, aes(x=age,group=gender,colour=gender)) + geom_freqpoly(stat = "bin",size=1) 
```

```{r visual-relationship-mean-trip-duration-and-age-per-gender-September-2020}
ggplot(NY20, aes(x=age,y=tripduration.min ,colour=gender)) + 
  stat_summary(fun.y="mean", geom="line", size=1) + facet_grid(gender ~ .) + 
  labs(title = "Relationship between Mean Trip Duration and Age per Gender", y="mean Trip Duration")
```





```{r column-graph-agegroup-tripduration-usertype-September-2020}
ggplot(data = NY20) + 
  geom_col(mapping = aes(x = agegroup, y = tripduration.min, colour=usertype))  

```

```{r bar-graph-Rush-hour-September-2020}
ggplot(NY20, aes(x=hour(NY20$starttime),fill=as.factor(hour(NY20$starttime))))+
  geom_bar() + 
  labs(title = "Rush Hour", x ="Hour") + facet_grid(usertype ~.) +         
  theme(legend.position = "none")
```

```{r bar-graph-percentage-of-trips-in-each-hour-of-the-day-by-usertype-September-2020}
ggplot(NY20) + geom_bar(aes(x=hour(NY20$starttime), y=(..count..)/sum(..count..), fill=usertype)) + theme_bw() + ylab("") + scale_fill_manual(values=c("sienna1", "sienna"))
```

```{r count-top-ten-most-used-bikes-for-September-2020 NY20}
NY20 %>%
  count(bikeid)%>%
  arrange(desc(n))%>%
  slice_head(n=10)
```

```{r most-used-bikes-September-2020}
pop_bikes <- sort(table(NY20$bikeid),decreasing=TRUE)[1:5]
ggplot(as.data.frame(pop_bikes),aes(Var1, Freq)) + coord_flip() + geom_col(aes(fill=Var1)) + 
  labs(title = "Most used bikes", y="Number of times used",x="Bike ID") + theme(legend.position = "none") +
  geom_text(aes(label= Freq), size = 3, position = position_stack(vjust = 0.5))
```


```{r count-last-ten-less-used-bikes-for-September-2020 }
NY20 %>%
  count(bikeid)%>%
  arrange(desc(n))%>%
  slice_tail(n=10)
```



# The dataframe for Washington DC does not have enough data for torough analysis.
# So we can only calculate few things below, but they are not comparable with NY data because DC data is quarterly and NY monthly. 

```{r glimpse-at-trips-dataframe-Washington-DC-last-quarter-2020}
glimpse(trips)
```

```{r count-top-ten-usage-of-each-bike-in-Washington-DC-for last quarter-2020 NY20}
trips %>%
  count(bike_id)%>%
  arrange(desc(n))%>%
  slice_head(n=10)
```

```{r least-used-bikes in Washington-DC-last-quarter-2020 NY20}
trips %>%
  count(bike_id)%>%
  arrange(desc(n))%>%
  slice_tail(n=10)
```

```{r count-number-of-bike-by-type-Washington-DC-last-quarter-2020 NY20}
trips %>%
  count(bike_type)
```

```{r count-trip-route-categories-Washington-DC-last-quarter-2020 NY20}
trips %>%
  count(trip_route_category)
```
