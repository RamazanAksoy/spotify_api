import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/utils/helpers/text_styles.dart';
import 'package:spotify_api/views/home/view-model/home_view_model.dart';

import '../../../core/constans/colors.dart';
import '../../favorite/view/favorite.dart';

class NewList extends StatelessWidget {
  const NewList({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, HomeViewModel value, child) => value
                .isLoadingnNewRelease
            ? Container()
            : Container(
                margin: EdgeInsets.only(top: 1.h),
                width: 100.w,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: value.newReleasesAlbum!.albums!.items!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Bounceable(
                            onTap: () {
                              value.setArtistId(value.newReleasesAlbum!.albums!
                                  .items![index].artists![0].id
                                  .toString());
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 5.w),
                                  width: 33.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22.sp),
                                    color: Colors.grey.shade300,
                                  ),
                                  child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(22.sp),
                                      child: Image.network(
                                        value.newReleasesAlbum!.albums!
                                            .items![index].images![0].url
                                            .toString(),
                                        fit: BoxFit.cover,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return const Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.green,
                                            ),
                                          );
                                        },
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5.w, top: 2.h),
                                  width: 25.w,
                                  child: Text(
                                    value.newReleasesAlbum!.albums!
                                        .items![index].name
                                        .toString(),
                                    style: Styles.titleStyle(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Bounceable(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FavoriteScreen(
                                          id: value.newReleasesAlbum!.albums!
                                              .items![index].artists![0].id),
                                    ));
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 5.w, top: 1.h),
                                width: 25.w,
                                child: Text(
                                    value.newReleasesAlbum!.albums!
                                        .items![index].artists![0].name
                                        .toString(),
                                    style: Styles.bodyStyle(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ))
                        ],
                      );
                    })));
  }
}
