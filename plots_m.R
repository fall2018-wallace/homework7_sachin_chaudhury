

library("ggplot2")

#plotting color coded map based on stateArea
areaColor_map<-ggplot(df_final,aes(map_id=stateName)) +
           geom_map(map=us,aes(fill=stateArea)) +
           expand_limits(x=df_final$long,y=df_final$lat) + 
           coord_map()+
           ggtitle("state map of US based on area")

#plotting color coded map based on Murder Rate
murderColor_map<-ggplot(df_final,aes(map_id=stateName)) +
  geom_map(map=us,aes(fill=Murder)) +
  expand_limits(x=df_final$long,y=df_final$lat) + 
  coord_map()+
  ggtitle("state map of US based on murder rate")
  
#plotting color coded map based on Murder rate and population as circle per state
population_map<-murderColor_map +
  geom_point(data=df_final,aes(x=long,y=lat,size=population))+
  ggtitle("state map of US based on murder rate and population")
  
#showing only north-east region for color coded map based on murder rate
murderColor_zooMap<-ggplot(df_final,aes(map_id=stateName)) +
  geom_map(map=us,aes(fill=Murder)) +
  coord_map()+
  xlim(long_nyc-10,long_nyc+10)+
  ylim(lat_nyc-10,lat_nyc+10)+
  ggtitle("northeastern region of US based on murder rate")

#showing only north-east region for above two maps-color based on murder and points based on population
population_zooMap<-murderColor_zooMap +
 geom_point(data=df_final,aes(x=long,y=lat,size=population))+
 ggtitle("northeastern region of US based on murder rate and population")
  
 
