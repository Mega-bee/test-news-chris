class FilterLiveScoreRequest {
 String? Category ;
 DateTime? Date;


 FilterLiveScoreRequest({
   this.Category,this.Date
});
 Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = <String, dynamic>{};
   data['Category']= this.Category.toString();
   data['Date']=DateTime.now().toString();



   return data;
 }

}