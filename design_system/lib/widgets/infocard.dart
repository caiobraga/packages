import 'package:flutter/material.dart';


import 'package:flutter_modular/flutter_modular.dart';
import '../app_design_system.dart';

import 'package:flutter_modular/flutter_modular.dart';


class DSInfoCard extends StatelessWidget {

  final appDesign = Modular.get<AppDesignSystem>();

  final Widget topinfo; 
  final Widget bottoninfo;
  final VoidCallback? onTap;
  Color? color ;

  

  DSInfoCard({
    super.key,
    required this.topinfo,
    required this.bottoninfo,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? appDesign.appColors.cardColor ,
      surfaceTintColor: appDesign.appColors.cardColor,
      elevation: 0.0,
      child:  Container(
        height: 170,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        topinfo,
           bottoninfo
      ],) ,) ,) ,) 
      
    );
  }
}
