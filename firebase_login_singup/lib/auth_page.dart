import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_singup/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth_types.dart';
import 'login_page.dart';


class AuthPage extends StatelessWidget {
  String authType;
  String appName;
  Function(String uid) onComplete ;
  AuthPage({super.key, this.authType = AuthTypes.phone, required this.appName, required this.onComplete});

 @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
           if(authType == AuthTypes.phone){
             
            return  VerificationPage(appName: appName, onComplete: onComplete,);
            } 
            if(authType == AuthTypes.emailPassword){
             
            return  VerificationPage(appName: appName, onComplete: onComplete,);
            }
          return  VerificationPage(appName: appName, onComplete: onComplete);
        } else {
          return LoginPage();
        }
      }),
    );
  }
}
