import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AppDesignSystem {
  String appName;
  AppColors appColors;
  Fonts appFonts;
  AppImages appImages;
  

  AppDesignSystem({required this.appColors, required this.appFonts, required this.appImages, required this.appName});
}

class AppColors {
  Color primaryColor;
  Color secondary ;
  Color tertiary ;

  Color whiteColor;
  Color blackColor;
  

  Color textButtonColor ;
  Color cardColor ;
  Color iconColor ;
  Color scaffoldBackground ;

  AppColors({required this.primaryColor, required this.secondary, required this.tertiary, required this.whiteColor, required this.blackColor, required this.textButtonColor, required this.cardColor, required this.iconColor, required this.scaffoldBackground});
}

class Fonts{
  double titleFont;
  double titleShortcuts;
  double subtitle;
  String? buttonTextFontFamily;

  Fonts({required this.titleFont, required this.titleShortcuts, required this.subtitle, this.buttonTextFontFamily}); 
}

class AppImages{
  String logoUrl;

  AppImages({required this.logoUrl});
}



class AppComponents {
  static AppBar appBar(Widget title, BuildContext context, {bool hasIcon = true, bool automaticallyImplyLeading = true, IconButton? iconButton} ) {
    final appDesign = Modular.get<AppDesignSystem>();
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: true,
      backgroundColor: appDesign.appColors.whiteColor,
      elevation: 0,
      title: title,
      actions: [
        hasIcon?
        iconButton!= null? iconButton : Container() :
            Text(""),
      ],
      foregroundColor: appDesign.appColors.blackColor,
    );
  }
}

