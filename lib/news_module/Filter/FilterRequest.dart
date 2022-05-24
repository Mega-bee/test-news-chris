class FilterNewsRequest {
  String? searchText;
  String? searchTextInTitle;
  String? fromDate;
  String? toDate;
  String? sortBy;


  FilterNewsRequest({ this.searchText, this.fromDate, this.toDate , this.sortBy});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['q']= this.searchText;
    data['qInTitle']= this.searchTextInTitle;
    data['from']= this.fromDate;
    data['to']= this.toDate;
    data['sortBy']= this.sortBy;
    data['apiKey']="a1a15821dc0e4d7cb89bd20d3f1e2202";
    return data;
  }
}