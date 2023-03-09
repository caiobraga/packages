import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFc500ff);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  // static const
}

class AppImages {
  static const String logoUrl =
      "https://cdn-icons-png.flaticon.com/512/86/86259.png";
}

class AppFonts {
  static const double titleFont = 52;
  static const double titleShortcuts = 24;
  static const double subtitle = 18;
}

class AppComponents {
  static AppBar appBar(Widget title, BuildContext context, {bool hasIcon = true, bool automaticallyImplyLeading = true, IconButton? iconButton} ) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: title,
      actions: [
        hasIcon?
        iconButton!= null? iconButton : Container() :
            Text(""),
      ],
      foregroundColor: Colors.black,
    );
  }
}
