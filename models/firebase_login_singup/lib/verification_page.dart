import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_modular/flutter_modular.dart';
import './verifyAuth.dart';
import 'firebaseLoginSingup_module.dart';

class VerificationPage extends VerifyAuth {
  
  VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  // GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Modular.get<FirebaseLoginSingupViewModel>();
    final appDesign = Modular.get<AppDesignSystem>();
    return Scaffold(
      appBar: AppComponents.appBar(
          hasIcon: false,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                viewModel.appName,
                style: TextStyle(
                    fontSize: appDesign.appFonts.titleShortcuts,
                    color: appDesign.appColors.blackColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          context),
      backgroundColor: appDesign.appColors.whiteColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    child: CircularProgressIndicator(),
                    height: 200.0,
                    width: 200.0,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text("Aguarde enquanto preparamos tudo para voce..."),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.pets, color: appDesign.appColors.primaryColor),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.pets, color: appDesign.appColors.primaryColor),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.pets, color: appDesign.appColors.primaryColor),
          )
          ],)
          
        ],
      )),
    );
  }
}
