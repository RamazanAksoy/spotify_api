import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer(
              builder: (BuildContext context, ProfileViewModel value, widget) {
                return value.isLoadingProfile == false
                    ? TopProfile(
                        imagePath: value.profile!.images![0].url!,
                        email: '${value.profile!.email}',
                        profileName: "${value.profile!.displayName}",
                        takipEdilenSayisi:
                            value.profile!.followers!.total!.toInt(),
                        takipciSayisi: 300)
                    : const Center(child: CircularProgressIndicator());
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.w, top: 3.h),
              child: Text(
                "PUBLIC PLAYLIST",
                style: Styles.boldFontStyle(),
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
                                imagePath:
                                    '${value.userPlayList!.items![index].images![0].url}',
                                songName:
                                    '${value.userPlayList!.items![index].name}',
                                artistName:
                                    '${value.userPlayList!.items![index].owner!.displayName}',
                              );
                            },
                          )
                        : CircularProgressIndicator();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
