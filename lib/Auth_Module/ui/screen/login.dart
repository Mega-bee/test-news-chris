import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/hive/hive.dart';
import 'package:news_app/network/WebUrl.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../Helpers/colors.dart';
import '../../../generated/l10n.dart';
import '../../../network/DataLoaderBloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../news_module/ui/screen/news-list-1.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final apiKey = TextEditingController(text:"a1a15821dc0e4d7cb89bd20d3f1e2202");

  final password = TextEditingController();

  String validatePass(value) {
    if (value.isEmpty) {
      return 'Required *';
    }
    return "";
  }

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(

        backgroundColor:PrimaryColor,
        body: BlocProvider(
          create: (BuildContext context) => DataLoaderBloc(Default()),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: mediaQueryHeight * 0.35,
                  width: mediaQueryWidth,
                  child: Stack(children: [
                    Container(
                      height: mediaQueryHeight * 0.62,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Text(
                                S.of(context).WelcomeToLive,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 38,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto-Bold'),
                              ),
                            ],
                          ),
                          // SizedBox(h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Container(

                                child: TextLiquidFill(
                                  text:S.of(context).NEWS1,
                                  boxHeight: 100,
                                  loadDuration: Duration(seconds: 1),
                                  waveDuration: Duration(seconds: 2),
                                  loadUntil: 0.82,
                                  boxWidth: 125,
                                  boxBackgroundColor:PrimaryColor,
                                  waveColor: Colors.red,
                                  textStyle: TextStyle(
                                      color:Colors.white,
                                      fontSize: 34,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular'),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaQueryWidth * 0.05),
                        child: TextFormField(
                            // cursorColor: Colors.blue,
                            style: const TextStyle(fontSize: 20),
                            controller: apiKey,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.key,color: Colors.red,),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: " Api Key",
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.black12)),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText:S.of(context).Required),
                              EmailValidator(errorText:S.of(context).NotavalidKey),
                            ]),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.emailAddress),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (apiKey.text.isEmpty) {
                            _formKey.currentState!.validate();
                          } else if(apiKey.text != Urls.apiToken){
                            Text(S.of(context).NotavalidKey);

                          }else{
                            {
                              AuthPrefsHelper().setToken(Urls.apiToken);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsListOne()),
                              );
                            }
                          }
                        },
                        child:  Text(
                            S.of(context).LOGIN,
                          style: TextStyle(
                              color:Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto-Bold'),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaQueryWidth * 0.35,
                              vertical: mediaQueryHeight * 0.025),
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
