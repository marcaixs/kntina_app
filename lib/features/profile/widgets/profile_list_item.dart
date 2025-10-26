import 'package:flutter/material.dart';

void _defaultOnTap() {}

class ProfileListItem extends StatelessWidget {
  final IconData? icon;
  final ImageIcon? imageIcon;
  final String title;
  final VoidCallback onTap;
  final bool showDivider;

  const ProfileListItem({
    super.key,
    this.icon,
    this.imageIcon,
    required this.title,
    this.onTap = _defaultOnTap,
    this.showDivider = true,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          leading: imageIcon ?? Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward),
          onTap: onTap,
        ),
        if (showDivider) const Divider(),
      ],
    );
  }
}