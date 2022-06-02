import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/Model/WebServiceResponse.dart';
import 'package:news_app/Weather/Request/filter_request.dart';
import 'package:news_app/Weather/model/weather_model.dart';


import '../../Helpers/colors.dart';
import '../../Views/connactionError.dart';
import '../../generated/l10n.dart';
import '../../hive/hive.dart';
import '../../network/DataLoaderBlocWeather.dart';
import '../../network/WebUrl.dart';


class WeatherScreen extends StatefulWidget {


  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {


  late DataLoaderBlocWeather weatherBloc;
  bool tempr =false;
  late double value;
 DateTime date= DateTime.parse(DateTime.now().toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper().getisDark()?Colors.black : PrimaryColor,
      appBar: AppBar(
        shadowColor: Colors.red,
        title: Text("${S.of(context).Weather}"),
      ),
      body:
        BlocBuilder<DataLoaderBlocWeather, GlobalState>(
        bloc: weatherBloc,
        builder: (context, state) {
          if (state is Loading) {
            print("Loading");
            return Center(
              child: TweenAnimationBuilder(

                tween: Tween(begin: 0.0,end: 1.0),
                duration: Duration(seconds: 1),


                builder: (context, Value,_)=>SizedBox(
                  width: 60.0,
                  height: 80.0,



                child:Lottie.asset("assets/images/64906-sunny.json",
                    height: 300,
                    width: 50,

                    reverse: true)
              ),),
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
                    Container(
                      height: 140,
                      width: 140,
                      child: Card(
                        shadowColor: Colors.amber,
                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(65.0),
                          ),
                          color: Colors.black12,
                          elevation: 45,


                          child:Image.network("http://openweathermap.org/img/w/${Data.weather![0].icon}.png",
                              fit: BoxFit.cover,
                            height: 1200.2,
                            width: 1200,




                          ),),
                    ),

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
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        height: MediaQuery.of(context).size.width*0.54,
                        child: Card(
                          color: ThemeHelper().getisDark()?Colors.black : PrimaryColor,
                          shadowColor: Colors.white,
                          margin: EdgeInsets.all(5),
                          shape:RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [Row(
                                  children: [
                                    Icon(FontAwesomeIcons.temperatureFull,color: Colors.white,),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                                    Text(
                                      "${S.of(context).Main} ",style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold

                                    ),
                                    ),
                                  ] ),
                                SizedBox(height:  MediaQuery.of(context).size.height*0.02,),

                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: TextButton(
          style: TextButton.styleFrom(
          primary: Colors.red,

          ),

          onPressed: (){
            setState(() {
              tempr=!tempr;
            });
          }
                                    ,
                                    child:
                                    Text(
                                    tempr==false?
                                      "${S.of(context).Temp} : ${(Data.main!.temp)!.toStringAsFixed(1)} °k":
          "${S.of(context).Temp} : ${(Data.main!.temp!-273.15).toStringAsFixed(1)} °C  "

          ,style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                        fontWeight: FontWeight.bold

                                  ),

                                    )

                                  ),
                                ),
                                SizedBox(height:  MediaQuery.of(context).size.height*0.03,),

                                Text(

                                  "${S.of(context).Humidity} : ${Data.main!.humidity} %",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold

                                ),
                                ),
                            ]),
                          ),
                        ),
                      ),



                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: MediaQuery.of(context).size.height*0.25,
                  child: Card(

                    shadowColor: Colors.white,
                    margin: EdgeInsets.all(5),
                    shape:RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 0),
                      borderRadius: BorderRadius.circular(10),
                    ),

color: ThemeHelper().getisDark()?Colors.black : PrimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.wind,color: Colors.white,),
SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                              Text(
                              "${S.of(context).wind} ",style: TextStyle(
                              color: Colors.red,
                              fontSize: 25,
                                fontWeight: FontWeight.bold

                            ),
                        ),
                         ] ),
                          SizedBox(height:  MediaQuery.of(context).size.height*0.03,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "${S.of(context).Speed} : ${Data.wind!.speed}",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,   fontWeight: FontWeight.bold

                            ),
                            ),
                          ),
                          SizedBox(height:  MediaQuery.of(context).size.height*0.04,),
                          Text(
                            "${S.of(context).Degree} : ${Data.wind!.deg} °",style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold

                          ),
                          ),

                      ]),
                    ),
                  ),
                ),
                ]),

              ]);


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
            lat: 33.8463,
            long: 35.9020,
          ).toJson(),
        ),
      );
    }
}
