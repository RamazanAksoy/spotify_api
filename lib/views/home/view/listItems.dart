import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/utils/helpers/text_styles.dart';
import 'package:spotify_api/views/home/view-model/home_view_model.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,HomeViewModel value, child) =>
      value.isLoadingnNewRelease?Container():
      
      Container(
      margin: EdgeInsets.only(top: 1.h),
                    width: 100.w,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: value.newReleasesAlbum!.albums!.items!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return
       Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5.w),
            width: 33.w,
            height: 20.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.sp), color: Colors.grey,
                image: DecorationImage(image: NetworkImage(value.newReleasesAlbum!.albums!.items![index].images![0].url.toString()),fit: BoxFit.cover)),
          ),
          Container(
            margin: EdgeInsets.only(left: 5.w, top: 2.h),
            width: 25.w,
            child: Text(
              value.newReleasesAlbum!.albums!.items![index].name.toString(),
              style: Styles.titleStyle(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5.w, top: 1.h),
            width: 25.w,
            child: Text(
              value.newReleasesAlbum!.albums!.items![index].artists![0].name.toString(),
              style: Styles.bodyStyle()),
          )
        ],
      );
                      }))
  
  
    );
  }
}
