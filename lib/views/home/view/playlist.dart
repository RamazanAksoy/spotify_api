import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/views/home/view-model/home_view_model.dart';

import '../../../utils/extensions/time_converter.dart';

class PlayListOnHomePage extends StatefulWidget {
  const PlayListOnHomePage({super.key});

  @override
  State<PlayListOnHomePage> createState() => _PlayListOnHomePageState();
}

class _PlayListOnHomePageState extends State<PlayListOnHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, HomeViewModel value, child) => value
              .isLoadingArtistTopTracks
          ? Container()
          : SizedBox(
              width: 100.w,
              height: 32.h,
              child: ListView.builder(
                itemCount: value.artistTopTracks!.tracks!.length,
                itemBuilder: (context, index) {
                  return Container(
                    //color: Colors.red,
                    margin:
                        EdgeInsets.only(bottom: 2.5.h, left: 3.6.h, right: 5.w),
                    height: 6.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 6.h,
                          alignment: Alignment.topLeft,
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
                              Padding(
                                padding: EdgeInsets.only(left: 3.w),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        width: 30.w,
                                        height: 2.h,
                                        child: Text(
                                            value.artistTopTracks!
                                                .tracks![index].album!.name
                                                .toString(),
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16.sp,
                                                color:
                                                    const Color(0xff000000))),
                                      ),
                                    ),
                                    Text(
                                        TimeConverter().artistListToString(value
                                            .artistTopTracks!
                                            .tracks![index]
                                            .album!
                                            .artists),
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 1.3.h,
                                            color: const Color(0xff000000)))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 12.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  TimeConverter().milisecontToSecondAndMinute(
                                      value.artistTopTracks!.tracks![index]
                                          .durationMs),
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
              )),
    );
  }
}
