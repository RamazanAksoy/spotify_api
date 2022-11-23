import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/utils/helpers/text_styles.dart';

class Playlist extends StatelessWidget {
  final String imagePath;
  final String songName;
  final String artistName;
  const Playlist(
      {super.key,
      required this.imagePath,
      required this.songName,
      required this.artistName});

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
            ),
            SizedBox(
              height: 8.h,
              width: 55.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    songName.toString(),
                    style: Styles.mediumFontStyle(),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    artistName.toString(),
                    style: Styles.mediumFontStyle(),
                  )
                ],
              ),
            ),
            Icon(
              Icons.more_horiz_rounded,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration profilePhoto(String path, double radius) {
    return BoxDecoration(
      color: Colors.black,
      image: DecorationImage(image: NetworkImage(path), fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
