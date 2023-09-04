import 'package:flutter_app/global/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  late final SharedPreferences _prefs;

  Future<StorageServices> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key,bool value) async{
    return await _prefs.setBool(key, value);
  }

  Future<bool>  setString(String key,String value) async{
    return await _prefs.setString(key, value);
  }


  bool getDeviceFirstOpen(){
    return _prefs.getBool(AppConst.STORAGE_DEVICE_OPEN_FIRST_TIME)?? false;
  }

  bool getIsLoggedIn(){
    return _prefs.getString(AppConst.STORAGE_USER_TOKEN_KEY)==null?false:true;
  }

}
