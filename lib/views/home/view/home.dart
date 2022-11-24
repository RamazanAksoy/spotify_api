import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/utils/helpers/text_styles.dart';
import 'package:spotify_api/views/home/view-model/home_view_model.dart';
import 'package:spotify_api/views/home/view/playlist.dart';

import 'appbar.dart';
import 'artist_list.dart';
import 'listItems.dart';
import 'cover_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> newsVs = [
    "News",
    "Video",
    "Artist",
    "Podcasts",
  ];
  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).getNewReleaseAlbum();
    Provider.of<HomeViewModel>(context, listen: false).getSeveralArtist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 93.h,
      child: Column(children: [
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
                    height: 42.h,
                    child: ContainedTabBarView(
                      tabs: [
                        Text('News', style: Styles.bodyStyle()),
                        Text('Video', style: Styles.bodyStyle()),
                        Text('Artist', style: Styles.bodyStyle()),
                        Text('Podcast', style: Styles.bodyStyle()),
                      ],
                      views: [
                        const ListCategories(),
                        Container(color: Colors.green),
                        const ArtistList(),
                        Container(color: Colors.green),
                      ],
                      onChange: (index) => print(index),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Playlist",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      const Text(
                        "See more",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const PlayListOnHomePage(),
                ],
              )),
        ),
      ]),
    );
  }
}
