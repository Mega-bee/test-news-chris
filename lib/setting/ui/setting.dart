import 'package:flutter/material.dart';

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
      backgroundColor: customColor,
      appBar:AppBar(
        title: Text(S.of(context).Settings),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),

        ),
      ) ,
      body: Column(children: [
SizedBox(height: 12,),
        Card(
          elevation: 5,
          shadowColor: Colors.red,
          color: customColor,
          child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(S.of(context).languages,style: TextStyle(color: Colors.white),),
            PopupMenuButton(
              color: customColor,
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
        Card(
          elevation: 5,
          shadowColor: Colors.red,
          color: customColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).theme,style: TextStyle(color: Colors.white),),
                PopupMenuButton(
                  color: customColor,
                  icon: Icon(Icons.language,color: Colors.red,),
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
                      // LocalizationService().setLanguage('en');
                      // setState(() {
                      //   S.load(Locale('en'));
                      // });
                    }
                    if (value == 2) {
                      // LocalizationService().setLanguage('ar');
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
        label:  Text(S.of(context).logout,style: TextStyle(color: customColor),),
        icon: const Icon(Icons.logout,color: Colors.red,),
        backgroundColor: Colors.grey,
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
    );
  }
}
