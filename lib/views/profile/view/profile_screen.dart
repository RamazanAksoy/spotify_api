import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/base/base_loading.dart';
import 'package:spotify_api/views/profile/view-model/profile_view_model.dart';
import 'package:spotify_api/views/profile/view/playlist.dart';
import 'package:spotify_api/views/profile/view/top_profile.dart';

import '../../../utils/helpers/text_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ProfileViewModel profileViewModel = ProfileViewModel();

  @override
  void initState() {
    Provider.of<ProfileViewModel>(context, listen: false).getProfile();
    Provider.of<ProfileViewModel>(context, listen: false).getUserPlaylist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 239, 239),
      body: Consumer(builder: (context,ProfileViewModel value, child) =>  BaseLoadingShimmer(loadingWidget: loadingWidget(), currentWidget: currentWidget(), isLoading: value.checkLoading),)
    );

  }

  Widget loadingWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 2.h),
        SizedBox(
          height: 36.h,
          width: double.infinity,
          child: Card(
            margin: const EdgeInsets.all(0),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60)),
            ),
            elevation: 2,
            shadowColor: Colors.grey.shade300,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 7.w, top: 3.h),
          child: Text(
            "PUBLIC PLAYLIST",
            style: Styles.titleStyle(),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        SizedBox(
          height: 48.55.h,
          width: double.infinity,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
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
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                          width: 45.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 1.5.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5.w),
                                ),
                              ),
                              SizedBox(
                                height: 0.9.h,
                              ),
                              Container(
                                height: 1.5.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5.w),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(children: [
                          Container(
                            height: 3.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                          ),
                          SizedBox(width: 2.w,),
                          Icon(
                            Icons.more_horiz_rounded,
                            color: Colors.grey.shade400,
                          ),
                        ],)

                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
  Widget currentWidget(){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
    
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.h),
          Consumer(
            builder: (BuildContext context, ProfileViewModel value, widget) {
              return value.isLoadingProfile == false
                  ? TopProfile(
                  imagePath: value.profile!.images![0].url!,
                  email: '${value.profile!.email??'xburakseker@gmail.com'}',
                  profileName: "${value.profile!.displayName}",
                  takipEdilenSayisi:value.profile!.followers!.total!.toInt(),
                  takipciSayisi: 300)
                  :  Container();
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.w, top: 3.h),
            child: Text(
              "PUBLIC PLAYLIST",
              style: Styles.titleStyle(),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          SizedBox(
            width: double.infinity,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Consumer(
                builder: (context, ProfileViewModel value, child) {
                  return value.isLoadingUserPlayList == false
                      ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: value.userPlayList!.items!.length,
                    itemBuilder: (context, index) {
                      return Playlist(
                        imagePath: value.userPlayList!.items![index]
                            .images!.isEmpty ==
                            false
                            ? '${value.userPlayList!.items![index].images![0].url}'
                            : "https://p1.hiclipart.com/preview/658/470/455/krzp-dock-icons-v-1-2-empty-grey-empty-text-png-clipart.jpg",
                        songName:
                        '${value.userPlayList!.items![index].name}',
                        artistName:
                        '${value.userPlayList!.items![index].owner!.displayName}',
                        trackTotal: value.userPlayList!.items![index].tracks!.total.toString(),
                      );
                    },
                  )
                      : Container();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
