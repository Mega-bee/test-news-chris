import 'package:flutter/material.dart';
import 'package:news_app/theme/theme_service.dart';

import '../../Auth_Module/ui/screen/login.dart';
import '../../CustomAlertDialog/CustomAlert.dart';
import '../../Helpers/colors.dart';
import '../../generated/l10n.dart';
import '../../hive/hive.dart';
import '../../localization/localization_service.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper().getisDark()?Colors.black : PrimaryColor,
      appBar:AppBar(
        backgroundColor: ThemeHelper().getisDark()?Colors.black : PrimaryColor,
        title: Text(S.of(context).Settings),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),

        ),
      ) ,
      body: Column(children: [
SizedBox(height: MediaQuery.of(context).size.height*0.1,),
        Card(
          elevation: 5,
          shadowColor: Colors.red,
          color: ThemeHelper().getisDark()?Colors.black : PrimaryColor,
          child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(S.of(context).languages,style: TextStyle(color: Colors.white),),
            PopupMenuButton(
              color: ThemeHelper().getisDark()?Colors.black : PrimaryColor,
              icon: Icon(Icons.language,color: Colors.red,),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      height: 2,
                      textStyle: TextStyle(color: Colors.red),
                      value: 0,
                      child: Text(S.of(context).languages)),
                  PopupMenuItem(
                      textStyle: TextStyle(color: Colors.white),
                      value: 1,
                      child: Text(S.of(context).English)),
                  PopupMenuItem(
                      textStyle: TextStyle(color: Colors.white),
                      value: 2,
                      child: Text(S.of(context).Arabic)),
                ];
              },
              onSelected: (value) {
                if (value == 1) {
                  LocalizationService().setLanguage('en');
                  // setState(() {
                  //   S.load(Locale('en'));
                  // });
                }
                if (value == 2) {
                  LocalizationService().setLanguage('ar');
                }
              },
            ),
          ],),
        ),),
        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
        Card(
          elevation: 5,
          shadowColor: Colors.red,
          color: ThemeHelper().getisDark()?Colors.black : PrimaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).theme,style: TextStyle(color: Colors.white),),
                PopupMenuButton(
                  color:ThemeHelper().getisDark()?Colors.black : PrimaryColor,
                  icon: Icon(Icons.color_lens,color: Colors.red,),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          height: 2,
                          textStyle: TextStyle(color: Colors.red),
                          value: 0,
                          child: Text(S.of(context).theme)),
                      PopupMenuItem(
                          textStyle: TextStyle(color: Colors.white),
                          value: 1,
                          child: Text(S.of(context).dark)),
                      PopupMenuItem(
                          textStyle: TextStyle(color: Colors.white),
                          value: 2,
                          child: Text(S.of(context).white)),
                    ];
                  },
                  onSelected: (value) {
                    if (value == 1) {

                     AppThemeDataService().switchDarkMode(true);
                     Navigator.pop(context);

                    }
                    if (value == 2) {
                      AppThemeDataService().switchDarkMode(false);
                      Navigator.pop(context);

                    }
                  },
                ),
              ],),
          ),),


      ],
      ),
      floatingActionButton: FloatingActionButton.extended(

        onPressed: () {

          showDialog(
            context: context,
            builder: (context) => CustomLogOutDialog(
              title: S.of(context).logout,
              content: "",
              yesBtn:() {
                AuthPrefsHelper().deleteToken().then((value) =>
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                            (route) => false));
              },
              noBtn: () {
                Navigator.pop(context);
              },
            ),
          );
        },
        label:  Text(S.of(context).logout,style: TextStyle(color: PrimaryColor),),
        icon: const Icon(Icons.logout,color: Colors.red,),
        backgroundColor: Colors.grey,
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
    );
  }
}
