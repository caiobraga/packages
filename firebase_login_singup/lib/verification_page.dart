import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vetners/pages/historic_page.dart';
import 'package:vetners/pages/notification_page.dart';
import 'package:vetners/pages/pets_page/pets_page.dart';
import 'package:vetners/pages/stores_page.dart';
import 'package:vetners/shared/design_system.dart';
import 'package:vetners/utils/verifyAuth.dart';

class VerificationPage extends VerifyAuth {
  VerificationPage({Key? key});

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
            children: const [
              Text(
                "Vetners",
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
