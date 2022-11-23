import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/utils/helpers/text_styles.dart';

class TopProfile extends StatelessWidget {
  final String imagePath;
  final String email;
  final String profileName;
  final int takipciSayisi;
  final int takipEdilenSayisi;
  const TopProfile(
      {super.key,
      required this.imagePath,
      required this.email,
      required this.profileName,
      required this.takipciSayisi,
      required this.takipEdilenSayisi});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(0),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60)),
        ),
        elevation: 2,
        shadowColor: Colors.grey.shade300,
        child: Padding(
          padding: EdgeInsets.only(top: 3.h, left: 7.w, right: 7.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 4.h,
                    width: 4.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.withOpacity(0.2)),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 15,
                      ),
                    ),
                  ),
                  Text(
                    "Profile",
                    style: Styles.regularFontStyle(),
                  ),
                  Icon(
                    Icons.more_vert_rounded,
                    color: Colors.grey,
                  )
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Container(
                height: 10.h,
                width: 10.h,
                decoration: profilePhoto("$imagePath", 50),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Text(
                "$email",
                style: Styles.regularFontStyle(),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "$profileName",
                style: Styles.regularFontStyle(),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "$takipEdilenSayisi",
                        style: Styles.regularFontStyle(),
                      ),
                      Text(
                        "Followers",
                        style: Styles.regularFontStyle(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "$takipciSayisi",
                        style: Styles.regularFontStyle(),
                      ),
                      Text(
                        "Followers",
                        style: Styles.regularFontStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
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
