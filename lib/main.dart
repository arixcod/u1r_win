import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:u1r/data/repos/auth_repo.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //get local storage

  await GetStorage.init();

  // Await splash untill other items loads

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);  

  await Firebase.initializeApp()
      .then((FirebaseApp value) => Get.put(Authrepo()));
       runApp(const MyApp());
}