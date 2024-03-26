import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_tz/features/main/data/model/user_model.dart';
import 'package:oracle_tz/internal/components/app_routes.dart';
import 'package:oracle_tz/internal/components/text_helper.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel? userModel;

  const ProfileScreen({
    super.key,
    this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 76.h,
          right: 16.w,
          left: 16.w,
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Image.asset('assets/images/woman.png'),
                SizedBox(height: 32.h),
                Text(
                  userModel?.username ?? '-',
                  style: TextHelper.s36,
                ),
                SizedBox(height: 16.h),
                Text(
                  userModel?.address?.city ?? '-',
                  style: TextHelper.w900s13,
                ),
                SizedBox(height: 32.h),
                Container(
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
                  width: 343.w,
                  child: Text(
                    'FOLLOW JANE',
                    style: TextHelper.w900s13White,
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: Colors.black,
                      width: 3.sp,
                    ),
                  ),
                  alignment: Alignment.center,
                  height: 52.h,
                  width: 343.w,
                  child: Text(
                    'MESSAGE',
                    style: TextHelper.w900s13Black,
                  ),
                ),
                SizedBox(height: 10.h),
                TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    context.go(RouterConstants.auth);
                  },
                  child: const Text(
                    'Выйти из аккаунта',
                  ),
                ),
                SizedBox(height: 32.h),
                GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  children: [
                    Image.asset(
                      'assets/images/Rectangle 2.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/Rectangle 2.2.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/Rectangle 2.4.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/Rectangle 2.1.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/Rectangle 2.1.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/Rectangle 2.3.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/Rectangle 2.5.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
