import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'firebaseLoginSingup_module.dart';


abstract class VerifyAuth extends StatefulWidget{
 // final UserController userController = UserController();
 // final TutorController tutorController = TutorController();


   VerifyAuth({Key? key, }) : super(key: key) {
   
    verifyAuth();
  }

  @override
  void initState() {
    //verifyAuth();
    print("teste");
  }



  verifyAuth() async {
    try{
      final viewModel = Modular.get<FirebaseLoginSingupViewModel>();
      User? user = FirebaseAuth.instance.currentUser;
      if(user != null){
        viewModel.onComplete(user.uid);
      }

      /*
       FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        print("id: "+ user.uid );
        
        viewModel.onComplete(user.uid);
        
        /*final users =
            await userController.buscarUserComCondicao(user.uid, 'user_id');
        final tutors =
            await tutorController.buscarTutorComCondicao(user.uid, 'user_id');

        if (users.isEmpty) {
          Modular.to.navigate('/nextPage');
          return;
        }

        Modular.to.navigate('/home');
        print(user.uid);*/
      } else {
        Modular.to.navigate('/');
      }
    });
    */
    }catch(e){
      Modular.to.navigate('/');
    }
    
    
   
  }
  
  @factory
  State createState();
}
