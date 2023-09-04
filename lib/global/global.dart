import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/services/storge_services.dart';

class Global{
   static late StorageServices storageServices;
   static Future init() async {
     WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp();
     storageServices = await StorageServices().init();
   }
}