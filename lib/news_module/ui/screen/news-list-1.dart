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
      backgroundColor: customColor,
      appBar: AppBar(
        toolbarHeight:MediaQuery.of(context).size.height/20,
    leading: Container(),


        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),

        ),),
        elevation: 0,
        automaticallyImplyLeading: false,
        title:
        _onsearch==true?Row(children:[ Text("Popular ",),
          Text("News",style: TextStyle(color: Colors.red),),
        ]):

        TextField(
            controller: _searchQuery,
            style: TextStyle(color: Colors.white),
            focusNode:queryFocusNode,
            cursorColor: Colors.red,
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
            color: customColor,
              icon: Icon(Icons.sort),
              itemBuilder: (context){
                return [
                  PopupMenuItem(

                      height: 2,
                      textStyle: TextStyle(color:Colors.red),
                      value: 0,
                      child: Text("Sort By")),
                  PopupMenuItem(
                      textStyle: TextStyle(color:Colors.white),
                      value: 1,
                      child: Text("Popularity")),
                  PopupMenuItem(
                      textStyle: TextStyle(color:Colors.white),
                      value: 2,
                      child: Text("PublishedAt")),
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
                        sortBy:"PublishedAt",
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



       BlocBuilder<DataLoaderBloc, GlobalState>(
            bloc: newsListBloc,
            builder: (context, state) {
          if (state is Loading) {
            print("Loading");
            return Expanded(flex: 1,
              child: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
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
                
                height: MediaQuery.of(context).size.height*0.8,
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
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(

            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.transparent

                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.transparent
            ),
            height: MediaQuery.of(context).size.height*0.079 ,

            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Filter By date :",style: TextStyle(color:Colors.white,fontSize: 12,fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height*0.034,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                        ),
                        child:
                        _selectedDateFrom==null?
                        Text(
                          'From',
                          style: TextStyle(fontSize: 10,color:customColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ):Text(
                          "From:${_selectedDateFrom.toString().split(' ').first}",
                          style: TextStyle(fontSize: 10,color:customColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: _presentDatePickerFrom,
                      ),
                    ),
                  ),

                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height*0.034,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
                      child:
                      _selectedDateTO==null?
                      Text(
                        'TO',
                        style: TextStyle(fontSize: 10,color: customColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ):Text(
                        "To:${_selectedDateTO.toString().split(' ').first}",
                        style: TextStyle(fontSize: 10,color:customColor
                          ,
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
                  },child: Text("Search",style: TextStyle(color: Colors.red),), )
                ]),
          ),
        ),
    ]));
  }
}
