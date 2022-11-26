import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotify_api/core/base/base_loading.dart';
import 'package:spotify_api/core/constans/app.dart';
import 'package:spotify_api/core/constans/colors.dart';
import 'package:spotify_api/utils/helpers/text_styles.dart';
import 'package:spotify_api/views/home/view-model/home_view_model.dart';
import 'package:spotify_api/views/home/view/playlist.dart';
import 'package:spotify_api/views/home/view/podcastlist.dart';

import 'appbar.dart';
import 'artist_list.dart';
import 'newlist.dart';
import 'cover_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).getNewReleaseAlbum();
    Provider.of<HomeViewModel>(context, listen: false).getSeveralArtist();
    Provider.of<HomeViewModel>(context, listen: false).getPodcast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100.w,
        height: 93.h,

        child: Consumer(builder: (context,HomeViewModel value, child) {
          print("ramo");
        return  BaseLoadingShimmer(loadingWidget:loadingWidget() , currentWidget: currentWidget(value), isLoading: value.checkLoading);}

        ));
  }


  Widget loadingWidget(){
    return        Column(children: [
      SizedBox(
        height: MediaQuery.of(context).padding.top,
      ),
      HomePageAppBar(
          startIcon: const Icon(Icons.search),
          endIcon: const Icon(Icons.more_vert_outlined)),
      SizedBox(
        width: 100.w,
        height: 82.8.h,
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  width: 90.w,
                  height: 15.h,
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.w),
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  height: 40.h,
                  child: ContainedTabBarView(
                    tabBarProperties: TabBarProperties(
                        indicatorColor: AppColors.green,
                        indicatorPadding: EdgeInsets.all(2.w)),
                    tabs: [
                      Text('News', style: Styles.bodyStyle()),
                      Text('Video', style: Styles.bodyStyle()),
                      Text('Artist', style: Styles.bodyStyle()),
                      Text('Podcast', style: Styles.bodyStyle()),
                    ],
                    views:  [
                      Container(
                          margin: EdgeInsets.only(top: 1.h),
                          width: 100.w,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return  Column(
                                  children: [

                                      Column(children: [  Container(
                                        margin: EdgeInsets.only(left: 5.w),
                                        width: 33.w,
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(22.sp),
                                            color: Colors.grey,
                                          ),
                                      ),


                                        Container(
                                          margin: EdgeInsets.only(left: 5.w, top: 2.h),
                                          width: 25.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(22.sp),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],),


                                  Container(
                                          margin: EdgeInsets.only(left: 5.w, top: 1.h),
                                          width: 25.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22.sp),
                                      color: Colors.grey,
                                    ),
                                        )
                                  ],

                                );
                              })),
                      Container(
                          margin: EdgeInsets.only(top: 1.h),
                          width: 100.w,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return  Column(
                                  children: [

                                    Column(children: [  Container(
                                      margin: EdgeInsets.only(left: 5.w),
                                      width: 33.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(22.sp),
                                        color: Colors.grey,
                                      ),
                                    ),


                                      Container(
                                        margin: EdgeInsets.only(left: 5.w, top: 2.h),
                                        width: 25.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(22.sp),
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],),


                                    Container(
                                      margin: EdgeInsets.only(left: 5.w, top: 1.h),
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(22.sp),
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],

                                );
                              })),
                      Container(
                          margin: EdgeInsets.only(top: 1.h),
                          width: 100.w,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return  Column(
                                  children: [

                                    Column(children: [  Container(
                                      margin: EdgeInsets.only(left: 5.w),
                                      width: 33.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(22.sp),
                                        color: Colors.grey,
                                      ),
                                    ),


                                      Container(
                                        margin: EdgeInsets.only(left: 5.w, top: 2.h),
                                        width: 25.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(22.sp),
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],),


                                    Container(
                                      margin: EdgeInsets.only(left: 5.w, top: 1.h),
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(22.sp),
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],

                                );
                              })),
                      Container(
                          margin: EdgeInsets.only(top: 1.h),
                          width: 100.w,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return  Column(
                                  children: [

                                    Column(children: [  Container(
                                      margin: EdgeInsets.only(left: 5.w),
                                      width: 33.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(22.sp),
                                        color: Colors.grey,
                                      ),
                                    ),


                                      Container(
                                        margin: EdgeInsets.only(left: 5.w, top: 2.h),
                                        width: 25.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(22.sp),
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],),


                                    Container(
                                      margin: EdgeInsets.only(left: 5.w, top: 1.h),
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(22.sp),
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],

                                );
                              })),
                    ],
                    onChange: (index) =>
                        Provider.of<HomeViewModel>(context, listen: false)
                            .setcurrentIndexTabContainer(index),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Playlist",
                        style: Styles.titleStyle(),
                      ),
                      Text(
                        "See more",
                        style: Styles.bodyStyle(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: 100.w,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.w),
                              color: Colors.grey),
                          margin:
                          EdgeInsets.only(bottom: 2.5.h, left:2.h, right: 2.w),
                          height: 6.h,
                        );
                      },
                    )),
              ],
            )),
      ),
    ]);
  }

  Widget currentWidget(HomeViewModel value){
    return        Column(children: [
      SizedBox(
        height: MediaQuery.of(context).padding.top,
      ),
      HomePageAppBar(
          startIcon: const Icon(Icons.search),
          endIcon: const Icon(Icons.more_vert_outlined)),
      SizedBox(
        width: 100.w,
        height: 82.8.h,
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                const CoverPage(),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  height: 40.h,
                  child: ContainedTabBarView(
                    tabBarProperties: TabBarProperties(
                        indicatorColor: AppColors.green,
                        indicatorPadding: EdgeInsets.all(2.w)),
                    tabs: [
                      Text('News', style: Styles.bodyStyle()),
                      Text('Video', style: Styles.bodyStyle()),
                      Text('Artist', style: Styles.bodyStyle()),
                      Text('Podcast', style: Styles.bodyStyle()),
                    ],
                    views: const [
                      NewList(),
                      ArtistList(),
                      ArtistList(),
                      PodcastList(),
                    ],
                    onChange: (index) =>
                        Provider.of<HomeViewModel>(context, listen: false)
                            .setcurrentIndexTabContainer(index),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Playlist",
                        style: Styles.titleStyle(),
                      ),
                      Text(
                        "See more",
                        style: Styles.bodyStyle(),
                      ),
                    ],
                  ),
                ),
                const PlayListOnHomePage(),
              ],
            )),
      ),
    ]);
  }


}
