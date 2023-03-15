import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth_types.dart';
import 'firebaseLoginSingup_module.dart';
import 'login_page.dart';
import './verification_page.dart';


class AuthPage extends StatelessWidget {
 
  AuthPage({super.key});

 @override
  Widget build(BuildContext context) {
    final viewModel = Modular.get<FirebaseLoginSingupViewModel>();
    final User? user = FirebaseAuth.instance.currentUser;

    return user != null? VerificationPage() : LoginPage();
  }
}
