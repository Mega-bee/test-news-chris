class FilterWeatherRequest {
 double? lat ;
 double? long;


FilterWeatherRequest({
   this.long,this.lat
});
 Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = <String, dynamic>{};
   data['lat']= this.lat.toString();
   data['lon']= this.long.toString();
   data['appid']= "c0d6d781bec63be8d252d0f6cfc5f287";


   return data;
 }
}