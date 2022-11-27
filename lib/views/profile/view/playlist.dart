import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/utils/helpers/text_styles.dart';

import '../../../core/constans/colors.dart';

class Playlist extends StatelessWidget {
  final String imagePath;
  final String songName;
  final String artistName;
  final String trackTotal;

  const Playlist(
      {super.key,
      required this.imagePath,
      required this.songName,
      required this.artistName,
      required this.trackTotal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 0.5.h),
      child: SizedBox(
        height: 8.h,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 6.h,
              width: 6.h,
              decoration: profilePhoto(imagePath, 10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.green,
                        ),
                      );
                    },
                  )),
            ),
            SizedBox(
              height: 8.h,
              width: 45.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    songName.toString(),
                    style: Styles.titleStyle(),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    artistName.toString(),
                    style: Styles.bodyStyle(),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  trackTotal.toString(),
                  style: Styles.bodyStyle(),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.grey.shade400,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration profilePhoto(String path, double radius) {
    return BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
