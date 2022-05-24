// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// import '../../../Auth_Module/ui/screen/login.dart';
// import '../../../Helpers/colors.dart';
//
// import '../../../news_module/ui/screen/news-list-1.dart';
//
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//
//   // Future<bool> getNextPage() {
//   //   String? token = AuthPrefsHelper().getToken();
//   //   if (token != null) {
//   //     return Future.value(true);
//   //   } else
//   //     return Future.value(false);
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//     // _controller = AnimationController(
//     //   duration: Duration(seconds: (30)),
//     //   vsync: this,
//     // );
//   }
//   //   WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
//   //     print("Splash delay");
//   //     Future.delayed(Duration(milliseconds: 8000));
//   //
//   //     getNextPage().then((value) => {
//   //       if (value)
//   //         Timer(
//   //             Duration(seconds: 3),
//   //                 () => Navigator.of(context).pushAndRemoveUntil(
//   //                 MaterialPageRoute(builder: (context) => NewsListOne()),
//   //                     (route) => false))
//   //       else
//   //         {
//   //           Timer(
//   //               Duration(seconds: 3),
//   //                   () => Navigator.of(context).pushAndRemoveUntil(
//   //                   MaterialPageRoute(builder: (context) => LoginScreen()),
//   //                       (route) => false))
//   //         }
//   //     });
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     Timer(
//         Duration(seconds:5),
//             () =>
//                 Navigator.of(context).pushAndRemoveUntil(
//                     MaterialPageRoute(builder: (context) => LoginScreen()),
//                         (route) => false));
//     return Scaffold(
//       backgroundColor: customColor,
//       body: Center(
//           child: Lottie.asset(
//             "assets/images/lf30_editor_xy4jwx1e.json",
//           )),
//     );
//   }
// }