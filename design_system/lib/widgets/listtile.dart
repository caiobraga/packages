import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import '../app_design_system.dart';


class DSCardListTileHorizontal extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? color;

  final appDesign = Modular.get<AppDesignSystem>();

  DSCardListTileHorizontal({
    super.key,
    required this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? appDesign.appColors.cardColor,
      surfaceTintColor: appDesign.appColors.cardColor,
      elevation: 0.0,
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class DSCardListTileVertical extends StatelessWidget {
  final Widget header;
  final Widget icon;
  final Widget title;
  final Widget footer;
  final VoidCallback onTap;
  final Color? color;

  final appDesign = Modular.get<AppDesignSystem>();

  DSCardListTileVertical({
    super.key,
    required this.header,
    required this.title,
    required this.icon,
    required this.footer,
    required this.onTap,
    this.color ,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Card(
        color: color ?? appDesign.appColors.cardColor,
        surfaceTintColor: appDesign.appColors.cardColor,
        elevation: 0.0,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              header,
              icon,
              title,
              footer,
            ],
          ),
        ),
      ),
    );
  }
}
