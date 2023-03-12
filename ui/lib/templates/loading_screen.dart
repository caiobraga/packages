import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:design_system/design_system.dart';
import 'package:core/core.dart';

class LoadingScreen<T> extends StatefulWidget {
  String title;
  String message;
  Future<T> action;
  LoadingScreen(
      {Key? key, required this.action, this.message = '', this.title = ''});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState<T> extends State<LoadingScreen<T>> {
  final appDesign = Modular.get<AppDesignSystem>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppComponents.appBar(
          automaticallyImplyLeading: false,
          hasIcon: false,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
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
              FutureBuilder(
                future: widget.action,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Future.delayed(Duration.zero, () {
                      Navigator.of(context).pop(snapshot.data);
                    });
                  }
                  if (snapshot.hasError) {
                    FeedBack(context: context)
                        .errorDialog(snapshot.error.toString());
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        child: CircularProgressIndicator(),
                        height: 200.0,
                        width: 200.0,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              Text(widget.message),
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
            ],
          )
        ],
      )),
    );
  }
}
