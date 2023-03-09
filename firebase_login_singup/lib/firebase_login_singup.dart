library firebase_login_singup;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_singup/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'auth_page.dart';
import 'auth_types.dart';
import 'login_page.dart';
import 'verify_code_page.dart';




class FirebaseLoginSingup extends StatelessWidget {
  String authType;
  String appName;
  Function(String uid) onComplete ;
  FirebaseLoginSingup({ this.authType = AuthTypes.phone, required this.appName, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return ModularApp(module: AppModule(appName: appName, onComplete: onComplete, authType: authType), child: MaterialApp.router(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ) ,) ;
  }
}

