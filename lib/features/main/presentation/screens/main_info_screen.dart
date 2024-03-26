import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_tz/features/main/data/model/user_model.dart';
import 'package:oracle_tz/internal/components/app_routes.dart';
import 'package:oracle_tz/internal/components/text_helper.dart';

class MainInfoScreen extends StatefulWidget {
  final UserModel userModel;

  const MainInfoScreen({super.key, required this.userModel});

  @override
  State<MainInfoScreen> createState() => _MainInfoScreenState();
}

class _MainInfoScreenState extends State<MainInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bigman.jpg',
            height: 1.sh,
            width: 1.sw,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 46.h,
            left: 16.w,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    context.push(
                      RouterConstants.profileScreen,
                      extra: {
                        'userModel': widget.userModel,
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/man.png',
                        height: 28.h,
                        width: 28.w,
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.userModel.name ?? '-',
                            style: TextHelper.s13White,
                          ),
                          Text(
                            widget.userModel.email ?? '-',
                            style: TextHelper.s11White,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 174.w),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.cancel_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
