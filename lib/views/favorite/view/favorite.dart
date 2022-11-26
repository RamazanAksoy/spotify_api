import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/base/base_loading.dart';
import 'package:spotify_api/utils/extensions/time_converter.dart';
import 'package:spotify_api/views/favorite/view-model/favorities_view_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key, this.id});
  final String? id;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    final aa = Provider.of<FavoritiesViewModel>(context, listen: false);
    aa.getArtistTopTrack(artistId: widget.id);
    aa.getArtistAlbum(artistId: widget.id);
    aa.getArtistWithId(artistId: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbarFavorite(),
            artistDetails(),
            artistAlbumsList(),
            artistSongsList()
          ],
        ),
      ),
    );
  }

  Widget artistSongsList() {
    return Consumer(
        builder: (context, FavoritiesViewModel value, child) =>
        value.isLoadingArtistTopTrack?Container():artistSongListCurrentWidget(value));

  }


  Column artistSongListCurrentWidget(FavoritiesViewModel value) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 26, left: 3.6.h),
          width: 345,
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Text("Songs",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: const Color(0xff222222)))),
              Text("See more",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: const Color(0xff131313))),
            ],
          ),
        ),
        SizedBox(
          width: 370,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: value.artistTopTracks!.tracks!.length,
            itemBuilder: (context, index) {
              return Container(
                //color: Colors.red,
                margin: EdgeInsets.only(bottom: 2.5.h, left: 3.6.h),
                height: 6.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 21.h,
                      height: 6.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 5.h,
                            height: 5.h,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffE6E6E6)),
                            child: Image.asset("assets/play.png"),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                child: SizedBox(
                                  width: 30.w,
                                  height: 2.h,
                                  child: Text(
                                      value.artistTopTracks!.tracks![index]
                                          .album!.name
                                          .toString(),
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp,
                                          color: const Color(0xff000000))),
                                ),
                              ),
                              Text(
                                  value.artistTopTracks!.tracks![index].album!
                                      .artists![0].name
                                      .toString(),
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 1.3.h,
                                      color: const Color(0xff000000)))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              TimeConverter().milisecontToSecondAndMinute(value
                                  .artistTopTracks!.tracks![index].durationMs),
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 1.9.h,
                                  color: const Color(0xff000000))),
                          Image.asset("assets/heart.png"),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget artistAlbumsList() {
    return Consumer(
      builder: (context, FavoritiesViewModel value, child) => value
              .isLoadingArtistAlbum
          ? Container()
          : Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 29),
                  width: 56,
                  height: 17,
                  child: Text("Albums",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: const Color(0xff222222))),
                ),
                Container(
                  height: 190,
                  margin: const EdgeInsets.only(left: 29),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: value.artistAlbum!.items!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 16, top: 17),
                            width: 130,
                            height: 135,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                    image: NetworkImage(value.artistAlbum!
                                        .items![index].images![0].url
                                        .toString())),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 18),
                              child: Text(
                                  value.artistAlbum!.items![index].name
                                      .toString(),
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                      color: const Color(0xff3A3A3A))))
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget artistDetails() {
    return Consumer(
      builder: (context, FavoritiesViewModel value, child) =>
          value.isLoadingArtistWithId
              ? Container()
              : Container(
                  height: 100,
                  margin: const EdgeInsets.only(top: 12),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(value.artistWithId!.artists![0].name.toString(),
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w700, fontSize: 20)),
                      Text(
                          " Popularity:${value.artistWithId!.artists![0].popularity}   Followers:${value.artistWithId!.artists![0].followers!.total} ",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: const Color(0xff393939))),
                      SizedBox(
                        width: 265,
                        height: 48,
                        child: Text(
                          "Genres : ${value.artistWithId!.artists![0].genres}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              color: const Color(0xff838383),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  )),
    );
  }

  Widget appbarFavorite() {
    return Consumer(
      builder: (context, FavoritiesViewModel value, child) =>
          value.isLoadingArtistWithId == true
              ? Container()
              : Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 240,
                      // ignore: prefer_const_constructors
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(value
                                  .artistWithId!.artists![0].images![0].url
                                  .toString()),
                              fit: BoxFit.cover),
                          color: Colors.transparent,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(69),
                              bottomRight: Radius.circular(69))),
                    ),
                    Positioned(
                      top: 40,
                      left: 25,
                      child: SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/left_chevron.png",
                                color: Colors.white),
                            Image.asset(
                              "assets/more_vertical.png",
                              color: Colors.white,
                              width: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
