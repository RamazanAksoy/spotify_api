import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlayListOnHomePage extends StatefulWidget {
  const PlayListOnHomePage({super.key});

  @override
  State<PlayListOnHomePage> createState() => _PlayListOnHomePageState();
}

class _PlayListOnHomePageState extends State<PlayListOnHomePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 5.w,
        ),
        Container(
          margin: EdgeInsets.only(top: 2.h),
          width: 10.w,
          height: 10.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.sp),
              color: Colors.grey.withOpacity(0.3)),
          child: Icon(
            Icons.play_arrow_rounded,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Column(
          children: [
            Text(
              "As It Was",
              style: TextStyle(fontSize: 16.5.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "Harry Styles",
              style: TextStyle(
                  fontSize: 14.sp, color: Colors.black.withOpacity(0.7)),
            )
          ],
        ),
        SizedBox(
          width: 29.w,
        ),
        Text(
          "5:33",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: 14.w,
        ),
        Icon(
          Icons.favorite,
          size: 20.sp,
          color: Colors.grey.withOpacity(0.8),
        )
      ],
    );
  }
}
