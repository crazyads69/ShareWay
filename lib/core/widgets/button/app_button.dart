import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';

class AppButton extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color? textColor;
  final BoxShape shape;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final bool isMargin;
  final bool isBorder;
  final int flex;

  AppButton({
    super.key,
    this.title,
    this.titleStyle,
    this.onPressed,
    this.isEnabled = true,
    this.backgroundColor,
    this.textColor,
    this.shape = BoxShape.rectangle,
    this.icon,
    this.padding,
    this.isMargin = false,
    this.flex = 1,
    this.isBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: isEnabled ? onPressed : null,
        child: Container(
          padding: padding ?? EdgeInsets.symmetric(vertical: 16.h),
          margin: isMargin
              ? EdgeInsets.symmetric(horizontal: 16.w)
              : EdgeInsets.zero,
          decoration: shape == BoxShape.rectangle
              ? BoxDecoration(
                  color: isEnabled
                      ? backgroundColor ?? AppColor.primaryColor
                      : AppColor.secondary200,
                  borderRadius: BorderRadius.circular(30),
                )
              : BoxDecoration(
                  shape: shape,
                  color: isEnabled
                      ? backgroundColor ?? AppColor.primaryColor
                      : AppColor.secondary200,
                  border: isBorder
                      ? Border.all(
                          color: AppColor.secondary300,
                        )
                      : null,
                ),
          child: icon ??
              Text(
                title ?? '',
                style: titleStyle ??
                    textTheme.titleSmall!.copyWith(
                      color: isEnabled
                          ? textColor ?? AppColor.white
                          : AppColor.secondary300,
                      fontWeight: FontWeight.w700,
                    ),
                textAlign: TextAlign.center,
              ),
        ),
      ),
    );
  }
}
