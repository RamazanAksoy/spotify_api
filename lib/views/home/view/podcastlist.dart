import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/utils/helpers/text_styles.dart';
import 'package:spotify_api/views/home/view-model/home_view_model.dart';

import '../../../core/constans/colors.dart';

class PodcastList extends StatelessWidget {
  const PodcastList({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, HomeViewModel value, child) => value.isLoadingPodcast
            ? Container()
            : Container(
                margin: EdgeInsets.only(top: 1.h),
                width: 100.w,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: value.podcastModel!.episodes!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Bounceable(
                        onTap: () {},
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
                                  borderRadius: BorderRadius.circular(22.sp),
                                  child: Image.network(
                                    value.podcastModel!.episodes![index]
                                        .images![0].url
                                        .toString(),
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
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
                            Container(
                              margin: EdgeInsets.only(left: 5.w, top: 2.h),
                              width: 25.w,
                              child: Text(
                                value.podcastModel!.episodes![index].name
                                    .toString(),
                                style: Styles.titleStyle(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    })));
  }
}
