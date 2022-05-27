import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Auth_Module/ui/screen/login.dart';
import '../../Helpers/colors.dart';
import '../../generated/l10n.dart';
import '../../hive/hive.dart';


class CustomLogOutDialog extends StatefulWidget {
  final String title;
  final String content;
  final Function yesBtn;
  final Function() noBtn;

  CustomLogOutDialog(
      {required this.title,
        required this.content,
        required this.yesBtn,
        required this.noBtn});

  @override
  State<CustomLogOutDialog> createState() => _CustomLogOutDialog();
}

class _CustomLogOutDialog extends State<CustomLogOutDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: customColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(
        widget.title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "BerlinSansFB"),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.content,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: "BerlinSansFB",
            ),
            textAlign: TextAlign.center,
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    AuthPrefsHelper().deleteToken().then((value) =>
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                                (route) => false));
                  },
                  child: Text(
                    S.of(context).Yes,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: "BerlinSansFB",
                        color: Colors.white),
                  )),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.of(context).No,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,

                      fontFamily: "BerlinSansFB",
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}