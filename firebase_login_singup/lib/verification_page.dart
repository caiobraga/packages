import 'package:firebase_login_singup/verifyAuth.dart';
import 'package:flutter/material.dart';
import 'package:design_system/vetner/design_system.dart';


class VerificationPage extends VerifyAuth {
  String appName;
  Function(String uid) onComplete ;
  VerificationPage({Key? key, required this.appName, required this.onComplete}) : super(key: key, onComplete: onComplete);

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
    return Scaffold(
      appBar: AppComponents.appBar(
          hasIcon: false,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                widget.appName,
                style: TextStyle(
                    fontSize: AppFonts.titleShortcuts,
                    color: AppColors.blackColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          context),
      backgroundColor: AppColors.whiteColor,
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
            child: Icon(Icons.pets, color: AppColors.primaryColor),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.pets, color: AppColors.primaryColor),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.pets, color: AppColors.primaryColor),
          )
          ],)
          
        ],
      )),
    );
  }
}
