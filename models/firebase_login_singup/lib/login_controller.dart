import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';


class LoginController {
  

  static final LoginController provider = LoginController._internal();

  factory LoginController() {
    return provider;
  }

  LoginController._internal();

  String verificationIdRecived = "";
  String phone = "";
  String code = "";
  String contryCode = "+55";

  void setPhone(String newphone){
    phone = newphone;
  }

  void setcode(String value){
    code = value;
  }

  final auth = FirebaseAuth.instance;

  Future<void> verifyCode()async{
    try{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationIdRecived, smsCode: code);

    UserCredential user = await auth.signInWithCredential(credential);
    print(verificationIdRecived);
    
    if(user.user != null){
      
      Modular.to.navigate('/verificationPage');
    }else{
      Modular.to.navigate('/');
    }
    }catch(e){
      Modular.to.navigate('/');
    }
   
    
  }
  


  Future<void> login() async {

    //print(phone);
      await auth.verifyPhoneNumber(
    phoneNumber: contryCode + phone,
    timeout: const Duration(seconds: 60),
    verificationCompleted: (PhoneAuthCredential credential) async {
      print("teste");

      await auth.signInWithCredential(credential);
     Modular.to.pushNamed('/', forRoot: true);
    },
    verificationFailed: (FirebaseAuthException e) {
      print(e.message);
    },
    codeSent: (String verificationId, int? resendToken) {
      verificationIdRecived = verificationId;
      print(verificationId);
      print(resendToken);
      Modular.to.pushNamed('/codeVerify', forRoot: true);
      
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      print(verificationId);
    },
  );
 
    // print('aaaaa');
    
  }
}
