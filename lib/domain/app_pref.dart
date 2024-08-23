import 'package:shared_preferences/shared_preferences.dart';

class AppPref{
  SharedPreferences? pref;
  static const String USER_ID_KEY="user_id";

  Future<void> initPrefs()async{
    pref =await SharedPreferences.getInstance();
  }

 String getUserId()
 {
    try {
      String? userId;
      userId = pref!.getString(USER_ID_KEY);
      if (userId == null || userId == '') {
        return '';
      }
      else {
        return userId;
      }
    }catch(e){
      print("hello");
      return '';
    }
  }

  setUserId(String userId){
    pref!.setString(USER_ID_KEY, userId);
  }

}