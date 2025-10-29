import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ESettingsMenuTile extends StatelessWidget {
  const ESettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // Check if tile is disabled (onTap is null)
    final bool isDisabled = onTap == null;

    return Opacity(
      opacity: isDisabled ? 0.5 : 1.0,
      child: ListTile(
        enabled: !isDisabled,
        leading: Icon(
          icon,
          size: 28,
          color: isDisabled ? EColors.grey : EColors.primary,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: isDisabled ? EColors.grey : null,
              ),
        ),
        subtitle: Text(
          subTitle,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: isDisabled ? EColors.grey : null,
              ),
        ),
        trailing: trailing,
        onTap: onTap, //?
      ),
    );
  }
}
