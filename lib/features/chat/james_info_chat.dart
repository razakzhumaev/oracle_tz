import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JamesInfoChat extends StatelessWidget {
  const JamesInfoChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'James',
          style: TextStyle(
            fontSize: 17.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
        ),
        child: Column(
          children: [
            SizedBox(height: 32.h),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/circle1.png',
                        height: 28.h,
                        width: 28.w,
                      ),
                      SizedBox(width: 16.w),
                      Container(
                        height: 84.h,
                        width: 299.w,
                        color: const Color.fromARGB(255, 230, 228, 228),
                        alignment: Alignment.center,
                        child: const Text(
                          'Really love your most recent photo. I’ve been\ntrying to capture the same thing for a few\nmonths and would love some tips!',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 84.h,
                        width: 299.w,
                        color: const Color.fromARGB(255, 230, 228, 228),
                        alignment: Alignment.center,
                        child: const Text(
                          'A fast 50mm like f1.8 would help with the\nbokeh. I’ve been using primes as they tend to\nget a bit sharper images.',
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Image.asset(
                        'assets/images/circle4.png',
                        height: 28.h,
                        width: 28.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/circle1.png',
                        height: 28.h,
                        width: 28.w,
                      ),
                      SizedBox(width: 16.w),
                      Container(
                        height: 50.h,
                        width: 299.w,
                        color: const Color.fromARGB(255, 230, 228, 228),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            SizedBox(width: 16.w),
                            const Text(
                              'Thank you! That was very helpful!',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
