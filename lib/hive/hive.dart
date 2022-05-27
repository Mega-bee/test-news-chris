import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveSetUp {
  static Future<void> init() async {
    await Hive.initFlutter();
    await publicBoxes();
  }


  static Future<void> publicBoxes() async {
    await Hive.openBox('Authorization');
    await Hive.openBox('language');
  }
}
class AuthPrefsHelper {
  var box = Hive.box('Authorization');


  void setToken(String username) {
    box.put('apikey', username);
  }

  String? getToken() {
    return box.get('apikey');
  }

Future <void> deleteToken()async{
    await box.clear();
}
}
class LanguageHelper{
  var box2 =Hive.box('language');

  void setLanguage(String name){
    box2.put('lang',name);
  }
  String? getLanguage(){
    return box2.get('lang');
  }
}