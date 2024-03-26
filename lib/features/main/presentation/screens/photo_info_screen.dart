import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_tz/features/main/data/model/photo_model.dart';

class PhotoInfoScreen extends StatelessWidget {
  final PhotoModel photoModel;

  const PhotoInfoScreen({super.key, required this.photoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            photoModel.thumbnailUrl ?? '-',
            height: 1.sh,
            width: 1.sw,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 46.h,
            left: 16.w,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.cancel_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
