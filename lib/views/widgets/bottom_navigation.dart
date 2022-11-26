import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api/views/widgets/bottom_viewModel.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({
    super.key,
  });

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, BottomViewModel value, child) => BottomNavigationBar(
              currentIndex: value.customSelectedIndex,
              onTap: (index) {
                value.changedCustomSelectedIndex(index,context);
              },
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/home.png",
                      color: value.customSelectedIndex == 0
                          ? Color(0xff1ED760)
                          : Color(0xff808080),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/discovery.png",
                      color: value.customSelectedIndex == 1
                          ? Color(0xff1ED760)
                          : Color(0xff808080),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/heart.png",
                      color: value.customSelectedIndex == 2
                          ? Color(0xff1ED760)
                          : Color(0xff808080),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/profile.png",
                      color: value.customSelectedIndex == 3
                          ? Color(0xff1ED760)
                          : Color(0xff808080),
                    ),
                    label: ""),
              ],
            ));
  }
}
