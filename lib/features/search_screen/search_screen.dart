import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_tz/internal/components/text_helper.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search',
            style: TextHelper.s36,
          ),
          SizedBox(height: 32.h),
          SizedBox(
            height: 52.h,
            width: 343.w,
            child: TextFormField(
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: 'Search all photos',
                filled: true,
                fillColor: Colors.grey[200],
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
          SizedBox(height: 32.h),
          Text(
            'ALL RESULTS',
            style: TextHelper.w900s13,
          )
        ],
      ),
    );
  }
}
