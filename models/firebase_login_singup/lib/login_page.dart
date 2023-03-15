import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  String messageErro = '';
  bool isLoading = false;
  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final appDesign = Modular.get<AppDesignSystem>();
    return Scaffold(
      backgroundColor: appDesign.appColors.primaryColor,
      body: SafeArea(
        child: InkWell(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),

              Expanded(
                flex: 3,
                child: Image.network(
                  appDesign.appImages.logoUrl,
                  color: Colors.white,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Text(
                        "Vetners",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: appDesign.appFonts.titleFont,
                            color: appDesign.appColors.whiteColor),
                      ),
                    ],
                  )),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(children: [
                        Container(
                          child: Text("+55"),
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8))
                        )
                        ,
                        Expanded(
                          
                          child:  TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            filled: true,
                            prefixIcon: Icon(
                              Icons.phone_iphone,
                              color: appDesign.appColors.primaryColor,
                            ),
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Insira seu número de telefone",
                            fillColor: Colors.white70),
                        onChanged: (value) {
                          // _loginStore.phoneNumber = value;
                          controller.setPhone(value);
                        },
                      ),
                        ),
                     
                      ],),
                      
                      const SizedBox(
                        height: 24.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: login,
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: appDesign.appColors.primaryColor,
                                    borderRadius: BorderRadius.circular(16)),
                                child:  isLoading
                                    ? CircularProgressIndicator(
                                        color: appDesign.appColors.whiteColor,
                                      )
                                    : const Text(
                                        "Entrar",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        messageErro,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
              ),
              const Expanded(flex: 1, child: SizedBox()),

              // SizedBox(
              //   height: 80,
              // )
            ],
          ),
        ),
      ),
    );
  }

  

  Future<void> login() async {
    final controller = LoginController();
    setState(() {
      isLoading = true;
      messageErro = '';
    });
    try {
      await controller.login();
      
    } catch (e) {
      messageErro = e.toString();
      setState(() {
     isLoading = false; 
    });
    }

    
  }
}
