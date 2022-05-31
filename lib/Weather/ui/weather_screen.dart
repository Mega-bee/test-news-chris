import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Model/WebServiceResponse.dart';
import 'package:news_app/Weather/Request/filter_request.dart';
import 'package:news_app/Weather/model/weather_model.dart';


import '../../Helpers/colors.dart';
import '../../Views/connactionError.dart';
import '../../hive/hive.dart';
import '../../network/DataLoaderBlocWeather.dart';
import '../../network/WebUrl.dart';


class WeatherScreen extends StatefulWidget {


  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {


  late DataLoaderBlocWeather weatherBloc;
  bool tempr =true;

 DateTime date= DateTime.parse(DateTime.now().toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper().getisDark()?Colors.black : PrimaryColor,
      appBar: AppBar(
        shadowColor: Colors.red,
        title: Text("Weather"),
      ),
      body:
        BlocBuilder<DataLoaderBlocWeather, GlobalState>(
        bloc: weatherBloc,
        builder: (context, state) {
          if (state is Loading) {
            print("Loading");
            return Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (state is ConnectionError) {
            print("Connection error");
            return ConnectionErrorScreen(
                errorMessage: 'connectionError',
                retry: () {
                  BlocProvider.of<DataLoaderBlocWeather>(context)
                    ..add(FetchData(Urls.NEWS_ONE,
                        requestType: RequestType.get));
                });
          } else if (state is Error) {
            print("Error try again please");
            return ConnectionErrorScreen(
                errorMessage: state.errorMessage,
                retry: () {
                  BlocProvider.of<DataLoaderBlocWeather>(context)
                    ..add(FetchData(Urls.NEWS_ONE,
                        requestType: RequestType.get));
                });
          } else if (state is Successfully) {
            WeatherServiceResponse ServiceWeather=  state.data as WeatherServiceResponse;
           WeatherModule Data = ServiceWeather.weatherModule as WeatherModule;

            return

              Column(
              children:[
                SizedBox(height: MediaQuery.of(context).size.height*0.04, ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Icon(FontAwesomeIcons.solidSun,size: 80,color: Colors.yellow,),
                    SizedBox(width: MediaQuery.of(context).size.width*0.2,),

                    SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                    Column(children:[
                      Row(children:[
                        Icon(FontAwesomeIcons.locationDot,color: Colors.red,size: 18,),
                        SizedBox(width: MediaQuery.of(context).size.width*0.01, ),
                        Text("${Data.name!}               ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                      ]),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01, ),
                      Row(children: [
                        Icon(FontAwesomeIcons.clock,color: Colors.red,size: 15,),
                        SizedBox(width: MediaQuery.of(context).size.width*0.02, ),
                        Text(DateFormat.yMMMMd().format(date).toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)],),
                    ]
                    ),
                ]),

                SizedBox(height: MediaQuery.of(context).size.height*0.04, ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      Column(
                        children: [Row(
                            children: [
                              Icon(FontAwesomeIcons.temperatureFull,color: Colors.white,),
                              SizedBox(width: MediaQuery.of(context).size.width*0.06,),
                              Text(
                                "Main ",style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30

                              ),
                              ),
                            ] ),
                          SizedBox(height:  MediaQuery.of(context).size.height*0.03,),

                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextButton(
          onPressed: (){
            setState(() {
              tempr=!tempr;
            });
          }
                              ,
                              child:
                              Text(
                              tempr==false?
                                "Temp : ${Data.main!.temp} °k":
          "Temp : ${(Data.main!.temp!-273.15).toStringAsFixed(1)} °C  "

          ,style: TextStyle(
                                color: Colors.white,
                                fontSize: 20

                            ),

                              )

                            ),
                          ),
                          SizedBox(height:  MediaQuery.of(context).size.height*0.03,),

                          Text(

                            "Humidity : ${Data.main!.humidity} %",style: TextStyle(
                              color: Colors.white,
                              fontSize: 20

                          ),
                          ),
                      ]),



                Card(
color: ThemeHelper().getisDark()?Colors.black : PrimaryColor,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.wind,color: Colors.white,),
SizedBox(width: MediaQuery.of(context).size.width*0.06,),
                          Text(
                          "Wind ",style: TextStyle(
                          color: Colors.red,
                          fontSize: 30

                        ),
                    ),
                     ] ),
                      SizedBox(height:  MediaQuery.of(context).size.height*0.05,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Speed : ${Data.wind!.speed}",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20

                        ),
                        ),
                      ),
                      SizedBox(height:  MediaQuery.of(context).size.height*0.04,),
                      Text(
                        "Degree : ${Data.wind!.deg} °",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20

                      ),
                      ),
                  ]),
                ),
                ])]);


          }
          return Container();
        })
    );
  }

    @override
    void initState() {

      weatherBloc =DataLoaderBlocWeather(Default());
      weatherBloc.add(
        FetchData(
          Urls.DOMAIN2,
          requestType: RequestType.get,
          query: FilterWeatherRequest(
            lat: 33.8938,
            long: 35.5018,
          ).toJson(),
        ),
      );
    }
}
