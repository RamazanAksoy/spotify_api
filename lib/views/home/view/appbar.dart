import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePageAppBar extends StatefulWidget {
  HomePageAppBar({super.key, required this.startIcon, required this.endIcon});

  Icon startIcon = const Icon(Icons.search);
  Icon endIcon = const Icon(Icons.more_vert_outlined);
  String spotifylogo = "assets/spotifylogo.png";

  @override
  State<HomePageAppBar> createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 7.h,
      child: Row(children: [
        SizedBox(
          width: 5.w,
        ),
        Icon(widget.startIcon.icon),
        const Spacer(),
        Padding(
          padding: EdgeInsets.all(13.sp),
          child: Image.asset(widget.spotifylogo),
        ),
        const Spacer(),
        Icon(widget.endIcon.icon),
        SizedBox(
          width: 5.w,
        ),
      ]),
    );
  }
}
