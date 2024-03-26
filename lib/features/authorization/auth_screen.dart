import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_tz/internal/components/app_routes.dart';
import 'package:oracle_tz/internal/components/text_helper.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/background_photo.png',
                    height: 707.h,
                    width: 1.sw,
                    fit: BoxFit.cover,
                  ),
                  Image.asset('assets/images/Group.png')
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                  right: 16.w,
                  left: 16.w,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.push(RouterConstants.login);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                        ),
                        alignment: Alignment.center,
                        height: 52.h,
                        width: 167.w,
                        child: Text(
                          'LOG IN',
                          style: TextHelper.w900s13,
                        ),
                      ),
                    ),
                    SizedBox(width: 9.w),
                    InkWell(
                      onTap: () {
                        context.push(RouterConstants.createAccount);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(
                            color: Colors.black,
                            width: 3.sp,
                          ),
                        ),
                        alignment: Alignment.center,
                        height: 52.h,
                        width: 167.w,
                        child: Text(
                          'RIGISTER',
                          style: TextHelper.w900s13White,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
