import 'package:auth_firebaseuas/app/controllers/auth_controller.dart';
import 'package:auth_firebaseuas/app/modules/home/views/home_view.dart';
import 'package:auth_firebaseuas/app/modules/login/views/login_view.dart';
import 'package:auth_firebaseuas/app/utils/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshoot) {
        print(snapshoot.data);
        if (snapshoot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            title: "Application",
            initialRoute: snapshoot.data != null ? Routes.HOME : Routes.LOGIN,
            getPages: AppPages.routes,
            // home: snapshoot.data != null ? HomeView() : LoginView(),
          );
        }
        return LoadingView();
      },
    );
  }
}
