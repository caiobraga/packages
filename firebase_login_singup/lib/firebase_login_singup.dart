library firebase_login_singup;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_singup/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth_page.dart';
import 'auth_types.dart';
import 'login_page.dart';
import 'verify_code_page.dart';




class FirebaseLoginSingup extends Module {
  String authType;
  String appName;
  Function(String uid) onComplete ;
  FirebaseLoginSingup({ this.authType = AuthTypes.phone, required this.appName, required this.onComplete});

  @override
  List<Bind> get binds => [
    
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => AuthPage( authType: authType, appName: appName, onComplete: onComplete), 
    children: [
     ChildRoute('/codeVerify',
            child: (context, args) => const VerifyCodePage()),
     ChildRoute('/verificationPage',
            child: (context, args) => VerificationPage(appName: appName, onComplete: onComplete,)),
    ]),
       
      ];
}

