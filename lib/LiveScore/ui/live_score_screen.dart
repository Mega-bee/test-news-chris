import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../Custom_page_route.dart';
import '../../Helpers/colors.dart';
import '../../Model/WebServiceResponse.dart';
import '../../Views/connactionError.dart';
import '../../hive/hive.dart';
import '../../network/DataLoaderBlocLiveScore.dart';
import '../../network/WebUrl.dart';
import '../Request/filter_request.dart';
import '../model/live_score.dart';
import 'cards.dart';

class LiveScore extends StatefulWidget {


  @override

  State<LiveScore> createState() => _LiveScoreState();
}

class _LiveScoreState extends State<LiveScore> {
  @override
  late DataLoaderBlocLiveScore liveScoreBloc;
  late Football football ;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper().getisDark()?Colors.black : PrimaryColor,
      appBar: AppBar(
        title: Text("LiveScore"),
      ),
      body:
      BlocBuilder<DataLoaderBlocLiveScore, GlobalState>(
    bloc: liveScoreBloc,
    builder: (context, state) {
      if (state is Loading) {
        print("Loading");
        return Center(
          child: TweenAnimationBuilder(

            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(seconds: 1),


            builder: (context, Value, _) =>
                SizedBox(
                    width: 260.0,
                    height: 280.0,


                    child: Lottie.asset("assets/images/96118-football-or-soccer-juggling.json",
                        height: 300,
                        width: 250,

                        reverse: true)
                ),),
        );
      } else if (state is ConnectionError) {
        print("Connection error");
        return ConnectionErrorScreen(
            errorMessage: 'connectionError',
            retry: () {
              BlocProvider.of<DataLoaderBlocLiveScore>(context)
                ..add(FetchData(Urls.NEWS_ONE,
                    requestType: RequestType.get));
            });
      } else if (state is Error) {
        print("Error try again please");
        return ConnectionErrorScreen(
            errorMessage: state.errorMessage,
            retry: () {
              BlocProvider.of<DataLoaderBlocLiveScore>(context)
                ..add(FetchData(Urls.NEWS_ONE,
                    requestType: RequestType.get));
            });
      } else if (state is Successfully) {
        print("Gen:${state.data}");
        football =state.data;



        return

          GridView.builder(

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (4 / 4),
                crossAxisSpacing: 1,
                mainAxisSpacing: 1),


            itemCount: football.stages!.length,
            itemBuilder: (context, index) {
              return InkWell(
                 onTap: (){
                   Navigator.push(
                       context,
                       CustomPageRoute(child:cards(

                       )));
                 },
                child: Card(
                  color: Colors.red,
                    shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(25.0),
                ),
                    child:

                Column(children: [

                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(football.stages![index].events![0].t1![0].nm.toString(),
                    style:TextStyle(fontSize: 15)
                      ,
                    ),
                  ),
                SizedBox(height: 40,),
                Image.network( "https://lsm-static-prod.livescore.com/medium/${football.stages![index].events![0].t1![0].img.toString()}",

                  fit: BoxFit.cover,

                  width: 80,
                ),
                ])),
              );
        } );

    }return Container();
    }));

  }

  @override
  void initState() {
    liveScoreBloc =DataLoaderBlocLiveScore(Default());
    liveScoreBloc.add(
      FetchData(
        Urls.DOMAIN3,

        requestType: RequestType.get,


        query: FilterLiveScoreRequest(
         Category: "football"
        ).toJson(),
      ),
    );
  }
}
