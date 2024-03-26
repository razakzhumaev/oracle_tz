import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_tz/internal/components/app_routes.dart';
import 'package:oracle_tz/internal/components/text_helper.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Chat',
            style: TextHelper.s17,
          ),
          Expanded(
            child: ListView(
              children: [
                const Divider(),
                SizedBox(height: 16.h),
                InkWell(
                  onTap: () {
                    context.push(RouterConstants.jamesInfoChat);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/circle1.png',
                      ),
                      SizedBox(width: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'James',
                            style: TextHelper.w700,
                          ),
                          const Text('Thank you! That was very helpful!'),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                const Divider(),
                SizedBox(height: 16.5.h),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/circle2.png',
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Will Kenny',
                          style: TextHelper.w700,
                        ),
                        const Text("I know... I'm trying to get the funds."),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 19.h),
                const Divider(),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/circle3.png',
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Beth Williams',
                          style: TextHelper.w700,
                        ),
                        const Text(
                            "I'm looking for tips around capturing the\nmilky way. I have a 6D with a 24-100mm..."),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 19.h),
                const Divider(),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/circle4.png',
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Beth Williams',
                          style: TextHelper.w700,
                        ),
                        const Text(
                            "Wanted to ask if you're available for a\nportraitshoot next week."),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
