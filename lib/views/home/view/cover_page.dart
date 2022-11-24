import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/views/home/view-model/home_view_model.dart';

import '../../../core/constans/colors.dart';
import '../../../utils/helpers/text_styles.dart';

class CoverPage extends StatefulWidget {
  const CoverPage({super.key});

  @override
  State<CoverPage> createState() => _CoverPageState();
}

class _CoverPageState extends State<CoverPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, HomeViewModel value, child) =>
          value.isLoadingnNewRelease
              ? Container()
              : Container(
                  width: 90.w,
                  height: 15.h,
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.w),
                      color: AppColors.green),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New Album",
                              style: Styles.bodyStyle(color: AppColors.white),
                            ),
                            Text(
                              "${value.newReleasesAlbum!.albums!.items![0].name}",
                              style: Styles.titleStyle(
                                  color: AppColors.white, fontSize: 19.sp),
                            ),
                            Text(
                              "${value.newReleasesAlbum!.albums!.items![0].artists![0].name}",
                              style: Styles.bodyStyle(color: AppColors.white),
                            ),
                          ]),
                      Container(
                        width: 25.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.sp),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "${value.newReleasesAlbum!.albums!.items![0].images![0].url}"),
                            )),
                      )
                    ],
                  ),
                ),
    );
  }
}
