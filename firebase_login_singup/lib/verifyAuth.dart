import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../data/tutor/tutor_controller.dart';
import '../data/user/user_controller.dart';

abstract class VerifyAuth extends StatefulWidget{
  final UserController userController = UserController();
  final TutorController tutorController = TutorController();
   VerifyAuth({Key? key }) : super(key: key) {
   
    verifyAuth();
  }


  verifyAuth() async {
    try{
       FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        print("id: "+ user.uid );
        
        final users =
            await userController.buscarUserComCondicao(user.uid, 'user_id');
        final tutors =
            await tutorController.buscarTutorComCondicao(user.uid, 'user_id');

        if (users.isEmpty) {
          Modular.to.navigate('/cadastroUser');
          return;
        }

        if (tutors.isEmpty) {
          Modular.to.navigate('/cadastroUser');
          return;
        }

        Modular.to.navigate('/home');
        print(user.uid);
      } else {
        Modular.to.navigate('/');
      }
    });
    }catch(e){
      Modular.to.navigate('/');
    }
   
  }
  
  @factory
  State createState();
}
