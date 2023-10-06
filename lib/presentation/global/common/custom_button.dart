import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.icon,
    this.spacing,
    required this.text,
    required this.onPressed,
    this.fontWeight,
    this.gradient,
    this.backgroundColor,
    this.fontSize,
    this.foregroundColor,
    this.radius,
    this.borderColor,
    this.hasShadow = true,
    this.shadowColor,
    this.shadowOpacity = 0.3,
    this.shadowBlurRadius = 3,
    this.shadowSpreadRadius = 1,
    this.width,
    this.verticalPadding,
    this.disabled = false,
  }) : super(key: key);

  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool disabled;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? foregroundColor;
  final Gradient? gradient;
  final bool hasShadow;
  final Widget? icon;
  final double? radius;
  final double shadowBlurRadius;
  final Color? shadowColor;
  final double shadowOpacity;
  final double shadowSpreadRadius;
  final double? spacing;
  final String text;
  final double? verticalPadding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      borderRadius: BorderRadius.circular(radius ?? 5.r),
      child: Container(
        padding: hasShadow ? EdgeInsets.all(5.r) : EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius ?? 5.r),
          onTap: !disabled ? onPressed : null,
          child: Ink(
            width: width ?? double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: 20.w, vertical: verticalPadding ?? 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 10.r),
              border: Border.all(color: borderColor ?? Colors.transparent),
              color: !disabled
                  ? backgroundColor ?? Get.theme.primaryColor
                  : Get.theme.primaryColor.withOpacity(0.5),
              gradient: gradient,
              boxShadow: !hasShadow || disabled
                  ? null
                  : [
                      BoxShadow(
                        color: (shadowColor ?? Colors.black)
                            .withOpacity(shadowOpacity),
                        spreadRadius: shadowSpreadRadius,
                        blurRadius: shadowBlurRadius,
                        offset: const Offset(0, 2),
                      ),
                    ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: Get.theme.textTheme.bodyLarge?.copyWith(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: foregroundColor ?? Colors.white,
                  ),
                ),
                if (icon != null)
                  SizedBox(
                    width: spacing ?? 10.w,
                  ),
                if (icon != null) icon!
              ],
            ),
          ),
        ),
      ),
    );
  }
}
