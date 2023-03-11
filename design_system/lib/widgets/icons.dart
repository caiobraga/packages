import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter_modular/flutter_modular.dart';
import '../app_design_system.dart';

class DSIconFilledPrimary extends _DSIconFilled {
  DSIconFilledPrimary({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.primaryColor;
}

class DSIconFilledSecondary extends _DSIconFilled {
  DSIconFilledSecondary({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.secondary;
}

class DSIconFilledTertiary extends _DSIconFilled {
  DSIconFilledTertiary({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.tertiary;
}

class DSIconFilledPrimarySmall extends _DSIconFilledSmall {
  DSIconFilledPrimarySmall({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.primaryColor;
}

class DSIconFilledSecondarySmall extends _DSIconFilledSmall {
  DSIconFilledSecondarySmall({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.secondary;
}

class DSIconFilledTertiarySmall extends _DSIconFilledSmall {
  DSIconFilledTertiarySmall({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();
  @override
  Color get color => appDesign.appColors.tertiary;
}

class DSIconFilledPrimaryLarge extends _DSIconFilledLarge {
  DSIconFilledPrimaryLarge({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.primaryColor;
}

class DSIconFilledSecondaryLarge extends _DSIconFilledLarge {
  DSIconFilledSecondaryLarge({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.secondary;
}

class DSIconFilledTertiaryLarge extends _DSIconFilledLarge {
  DSIconFilledTertiaryLarge({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.tertiary;
}

class DSIconPrimary extends _DSIcon {
  DSIconPrimary({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.primaryColor;
}

class DSIconSecondary extends _DSIcon {
  DSIconSecondary({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();
  
  @override
  Color get color => appDesign.appColors.secondary;
}

class DSIconTertiary extends _DSIcon {
  DSIconTertiary({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.tertiary;
}

class DSIconSmallPrimary extends _DSIconSmall {
  DSIconSmallPrimary({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.primaryColor;
}

class DSIconSmallSecondary extends _DSIconSmall {
  DSIconSmallSecondary({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.secondary;
}

class DSIconSmallTertiary extends _DSIconSmall {
  DSIconSmallTertiary({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.tertiary;
}

class DSIconLargePrimary extends _DSIconLarge {
  DSIconLargePrimary({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.primaryColor;
}

class DSIconLargeSecondary extends _DSIconLarge {
  DSIconLargeSecondary({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();
  @override
  Color get color => appDesign.appColors.secondary;
}

class DSIconLargeTertiary extends _DSIconLarge {
  DSIconLargeTertiary({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.tertiary;
}

class DSIconLargeWhite extends _DSIconLarge {
  DSIconLargeWhite({super.key, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get color => appDesign.appColors.iconColor;
}

/// abstract classes

abstract class _DSIconFilled extends StatelessWidget {
  _DSIconFilled({super.key, required this.iconName});

  final appDesign = Modular.get<AppDesignSystem>();
  final String iconName;
  Color get color;

  IconData get icon => MdiIcons.fromString(iconName) ?? MdiIcons.exclamation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: appDesign.appColors.secondary,
      ),
      child: Icon(icon, color: appDesign.appColors.iconColor),
    );
  }
}

abstract class _DSIconFilledSmall extends StatelessWidget {
  _DSIconFilledSmall({super.key, required this.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  final String iconName;
  Color get color;

  IconData get icon => MdiIcons.fromString(iconName) ?? MdiIcons.exclamation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.0,
      width: 28.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        color: appDesign.appColors.secondary,
      ),
      child: Icon(icon, color: appDesign.appColors.iconColor, size: 20,),
    );
  }
}


abstract class _DSIconFilledLarge extends StatelessWidget {
  _DSIconFilledLarge({super.key, required this.iconName});
  
  final appDesign = Modular.get<AppDesignSystem>();
  final String iconName;
  Color get color;

  IconData get icon => MdiIcons.fromString(iconName) ?? MdiIcons.exclamation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: appDesign.appColors.secondary,
      ),
      child: Icon(icon, color: appDesign.appColors.iconColor, size: 60,),
    );
  }
}


abstract class _DSIcon extends StatelessWidget {
  _DSIcon({super.key, required this.iconName});

  final appDesign = Modular.get<AppDesignSystem>();
  final String iconName;
  Color get color;

  IconData get icon => MdiIcons.fromString(iconName) ?? MdiIcons.exclamation;

  double get size => 40.0;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: color, size: size);
  }
}

abstract class _DSIconSmall extends _DSIcon {
  _DSIconSmall({super.key, required super.iconName});
  
  @override
  double get size => 24.0;
}

abstract class _DSIconLarge extends _DSIcon {
  _DSIconLarge({super.key, required super.iconName});

  @override
  double get size => 40.0;
}

