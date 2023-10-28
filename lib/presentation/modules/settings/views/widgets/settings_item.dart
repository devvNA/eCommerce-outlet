import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../global/utils/constants.dart';
import '../../controllers/settings_controller.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    required this.icon,
    this.isAccount = false,
    this.isDark = false,
    required this.onTap,
    this.subtitle,
  });

  final String icon;
  final bool isAccount;
  final bool isDark;
  final VoidCallback onTap;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
        onTap: onTap,
        child: ListTile(
          title: Text(title,
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: 16.sp,
              )),
          subtitle: !isAccount
              ? null
              : Text(
                  "$subtitle",
                  style: context.theme.textTheme.bodyMedium,
                ),
          leading: CircleAvatar(
            radius: isAccount ? 30.r : 25.r,
            backgroundColor: theme.primaryColor,
            child: SvgPicture.asset(icon, fit: BoxFit.none),
          ),
          trailing: isDark
              ? GetBuilder<SettingsController>(
                  id: 'Theme',
                  builder: (controller) => CupertinoSwitch(
                    value: !controller.isLightTheme,
                    onChanged: controller.changeTheme,
                    activeColor: theme.primaryColor,
                  ),
                )
              : Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: SvgPicture.asset(Constants.forwardArrowIcon,
                      fit: BoxFit.none),
                ),
        ));
  }
}
