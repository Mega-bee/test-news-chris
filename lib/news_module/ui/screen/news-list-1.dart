import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_module/ui/widget/NewsCard.dart';

import '../../../Helpers/colors.dart';
import '../../Filter/FilterRequest.dart';
import '../../model/NewsOne.dart';
import '../../../Views/connactionError.dart';
import '../../../network/DataLoaderBloc.dart';
import '../../../network/WebUrl.dart';

class NewsListOne extends StatefulWidget {
  const NewsListOne({Key? key}) : super(key: key);

  @override
  State<NewsListOne> createState() => _NewsListOneState();
}

class _NewsListOneState extends State<NewsListOne> {


  var  _selectedDateTO ;
  var  _selectedDateFrom;
  List<NewsOne> news = [];
  var _searchQuery =TextEditingController();
  final queryFocusNode =FocusNode();
  bool _onsearch=true;

  late DataLoaderBloc newsListBloc;
@override
  void initState() {
  _searchQuery.text = 'tesla';
  queryFocusNode.unfocus();
  newsListBloc = DataLoaderBloc(Default());
  newsListBloc.add(
    FetchData(
      Urls.NEWS_ONE,
      requestType: RequestType.get,
      query: FilterNewsRequest(
        searchText: _searchQuery.text,
      ).toJson(),
    ),
  );
    // TODO: implement initState
    super.initState();
  }
  @override
  void _presentDatePickerTO() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {

       _selectedDateTO = pickedDate;
      });
    });
    print('...');
  }
  void _presentDatePickerFrom() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {

        _selectedDateFrom = pickedDate;
      });
    });
    print('...');
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title:
        _onsearch==true?Text("Popular News"):

        TextField(
            controller: _searchQuery,
            focusNode:queryFocusNode,
            cursorColor: Colors.white,
            decoration: InputDecoration(
                hintText: "Search News",
                hintStyle: TextStyle(color: Colors.white
                ),),),
        actions: [
          IconButton(onPressed: (){
            if (_searchQuery.text.isNotEmpty) {
              queryFocusNode.unfocus();
              newsListBloc.add(
                FetchData(
                  Urls.NEWS_ONE,
                  requestType: RequestType.get,
                  query: FilterNewsRequest(searchText: _searchQuery.text)
                      .toJson(),
                ),
              );
            }
            setState(() {
              _onsearch=!_onsearch;


            });
    },
               icon:Icon(Icons.search)),
          PopupMenuButton(
              icon: Icon(Icons.sort),
              itemBuilder: (context){
                return [
                  PopupMenuItem(
                      height: 2,
                      textStyle: TextStyle(color:customColor),
                      value: 0,
                      child: Text("Sort By")),
                  PopupMenuItem(
                      value: 1,
                      child: Text("Popularity")),
                  PopupMenuItem(
                      value: 2,
                      child: Text("PublishidAt")),
                ];
              },
          onSelected: (value){
                if (value ==1){
                  newsListBloc.add(
                    FetchData(
                      Urls.NEWS_ONE,
                      requestType: RequestType.get,
                      query: FilterNewsRequest(searchText: _searchQuery.text,
                        sortBy:"Popularity",
                        fromDate: _selectedDateFrom.toString(),
                        toDate: _selectedDateTO.toString(),
                      )
                          .toJson(),
                    ),
                  );
                }
                if (value ==2){
                  newsListBloc.add(
                    FetchData(
                      Urls.NEWS_ONE,
                      requestType: RequestType.get,
                      query: FilterNewsRequest(searchText: _searchQuery.text,
                        sortBy:"PublishidAt",
                        fromDate: _selectedDateFrom.toString(),
                        toDate: _selectedDateTO.toString(),
                      )
                          .toJson(),
                    ),

                  );}
          },
          )
        ],
      ),
      body:
      Column(children:[


          Container(
            height: MediaQuery.of(context).size.height*0.06 ,
            color:customColor ,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Filter By date",style: TextStyle(color:Colors.white,fontSize: 12,fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height*0.031,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    child:
                    _selectedDateFrom==null?
                    Text(
                      'From',
                      style: TextStyle(fontSize: 13,color:customColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ):Text(
                      _selectedDateFrom.toString().split(' ').first,
                      style: TextStyle(fontSize: 13,color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentDatePickerFrom,
                  ),
                ),
              ),

              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height*0.031,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  child:
                  _selectedDateTO==null?
                  Text(
                    'TO',
                    style: TextStyle(fontSize: 13,color: customColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ):Text(
                    _selectedDateTO.toString().split(' ').first,
                  style: TextStyle(fontSize: 13,color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  onPressed: _presentDatePickerTO,
                ),
              ),
              TextButton(onPressed: (){
                newsListBloc.add(
                  FetchData(
                    Urls.NEWS_ONE,
                    requestType: RequestType.get,
                    query: FilterNewsRequest(searchText: _searchQuery.text,
                    fromDate: _selectedDateFrom.toString(),
                      toDate: _selectedDateTO.toString(),
                    )
                        .toJson(),
                  ),
                );
              },child: Text("Search"), )
            ]),
          ),
       BlocBuilder<DataLoaderBloc, GlobalState>(
            bloc: newsListBloc,
            builder: (context, state) {
          if (state is Loading) {
            print("Loading");
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is ConnectionError) {
            print("Connection error");
            return ConnectionErrorScreen(
                errorMessage: 'connectionError',
                retry: () {
                  BlocProvider.of<DataLoaderBloc>(context)
                    ..add(FetchData(Urls.NEWS_ONE,
                        requestType: RequestType.get));
                });
          }
          else if (state is Error) {
            print("Error try again please");
            return ConnectionErrorScreen(
                errorMessage: state.errorMessage,
                retry: () {
                  BlocProvider.of<DataLoaderBloc>(context)
                    ..add(FetchData(Urls.NEWS_ONE,
                        requestType: RequestType.get));
                });
          } else if (state is Successfully) {
            print("Successfully");
            news.clear();
            for (var item in state.data) {
              news.add(item);
            }
            return
              Container(
                height: MediaQuery.of(context).size.height*0.80,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    return
                      NewsCard(news[index]);
                  }),
              );
          }
          return Container();
        }),

    ]));
  }
}
