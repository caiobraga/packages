import 'package:flutter_modular/flutter_modular.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import './verification_page.dart';
import 'auth_page.dart';
import 'auth_types.dart';
import 'login_page.dart';
import 'verify_code_page.dart';


class FirebaseLoginSingupViewModel {
  final FirebaseAuth auth;
  final String appName;
  final String authType;
  final Function(String uid) onComplete;
  FirebaseLoginSingupViewModel({required this.auth, required this.appName, required this.authType, required this.onComplete});
}

class FirebaseLoginSingupModule extends Module {
  

  
  
  @override
  final List<Bind> binds = [
    
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => AuthPage(), 
    children: [
     ChildRoute('/codeVerify',child: (_, args) => const VerifyCodePage()),
     ChildRoute('/verificationPage',
            child: (_, args) => VerificationPage()),
  ])
  ];

}