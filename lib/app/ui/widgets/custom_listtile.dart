import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final Widget? leading;

  const CustomListTile({
    super.key, 
    this.icon, 
    this.title, 
    this.subtitle, 
    this.trailing, 
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).colorScheme.primary;

    return ListTile(
      leading: leading != null 
        ? IconTheme(
            data: IconThemeData(color: iconColor), 
            child: leading!
          )
        : icon != null 
          ? Icon(icon, color: iconColor)
          : null,
      title: title != null ? Text(title!) : null,
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: trailing != null 
        ? IconTheme(
            data: IconThemeData(color: iconColor), 
            child: trailing!
          )
        : icon != null 
          ? Icon(icon, color: iconColor)
          : null,
    );
  }
}
