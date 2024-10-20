import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Dialog(
        backgroundColor: AppColor.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          color: AppColor.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: const LoadingIndicator(
                  indicatorType: Indicator.pacman,
                  colors: [
                    AppColor.primaryColor,
                    AppColor.primary200,
                  ],
                  strokeWidth: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
