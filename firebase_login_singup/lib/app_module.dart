import 'package:firebase_login_singup/firebase_login_singup.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth_page.dart';
import 'auth_types.dart';
import 'verification_page.dart';
import 'verify_code_page.dart';


class AppModule extends Module {
  String authType;
  String appName;
  Function(String uid) onComplete ;
  AppModule({ this.authType = AuthTypes.phone, required this.appName, required this.onComplete});
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
