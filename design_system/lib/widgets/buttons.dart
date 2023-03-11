import 'package:design_system/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../app_design_system.dart';
import 'icons.dart';

abstract class DSButtonLarge extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const DSButtonLarge({
    super.key,
    required this.onPressed,
    required this.text,
  });

  Color get backgroundColor;

  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      child: Container(height: 50, width: 250, child: Center(child: DSTextButton(text: text))),
    );
  }
}

class DSButtonLargePrimary extends DSButtonLarge {
  DSButtonLargePrimary({super.key, required super.onPressed, required super.text});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get backgroundColor => appDesign.appColors.primaryColor;
}

class DSButtonLargeSecondary extends DSButtonLarge {
  DSButtonLargeSecondary({super.key, required super.onPressed, required super.text});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get backgroundColor => appDesign.appColors.secondary;
}

class DSButtonLargeTertiary extends DSButtonLarge {
  DSButtonLargeTertiary({super.key, required super.onPressed, required super.text});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get backgroundColor => appDesign.appColors.tertiary;
}

abstract class DSButtonSmall extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const DSButtonSmall({
    super.key,
    required this.onPressed,
    required this.text,
  });

  Color get backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      child: SizedBox(height: 50, width: 100, child: Center(child: DSTextButton(text: text))),
    );
  }
}

class DSButtonSmallPrimary extends DSButtonSmall {
  DSButtonSmallPrimary({super.key, required super.onPressed, required super.text});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get backgroundColor => appDesign.appColors.primaryColor;
}

class DSButtonSmallSecondary extends DSButtonSmall {
  DSButtonSmallSecondary({super.key, required super.onPressed, required super.text});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get backgroundColor => appDesign.appColors.secondary;
}

class DSButtonSmallTertiary extends DSButtonSmall {
  DSButtonSmallTertiary({super.key, required super.onPressed, required super.text});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get backgroundColor => appDesign.appColors.tertiary;
}

abstract class DSButtonWithIconLarge extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final String iconName;

  const DSButtonWithIconLarge({
    super.key,
    required this.onPressed,
    required this.text,
    required this.iconName,
  });

  Color get backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      child: Container(
          height: 50,
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(child: DSTextButton(text: text)),
              DSIconLargeWhite(
                iconName: iconName,
              ),
            ],
          )),
    );
  }
}

class DSButtonWithIconLargePrimary extends DSButtonWithIconLarge {
  DSButtonWithIconLargePrimary({super.key, required super.onPressed, required super.text, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get backgroundColor => appDesign.appColors.primaryColor;
}

class DSButtonWithIconLargeSecondary extends DSButtonWithIconLarge {
  DSButtonWithIconLargeSecondary({super.key, required super.onPressed, required super.text, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();

  @override
  Color get backgroundColor => appDesign.appColors.secondary;
}

class DSButtonWithIconLargeTertiary extends DSButtonWithIconLarge {
  DSButtonWithIconLargeTertiary({super.key, required super.onPressed, required super.text, required super.iconName});
  final appDesign = Modular.get<AppDesignSystem>();
  
  @override
  Color get backgroundColor => appDesign.appColors.tertiary;
}
