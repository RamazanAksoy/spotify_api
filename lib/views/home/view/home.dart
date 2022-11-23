import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constans/colors.dart';
import 'package:spotify_api/views/home/view-model/categories_view_model.dart';

import '../../../utils/helpers/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategorieViewModel categorieViewModel = CategorieViewModel();

  @override
  void initState() {
    categorieViewModel.getNewReleaseAlbum();
    //Provider.of<CategorieViewModel>(context, listen: false).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 3.h, left: 2.w, right: 2.w),
          child: Column(children: [
            appBarSearch(),
            newReleaseAlbum(),
            
          ]),
        ),
      ),
    );
  }

  Container newReleaseAlbum() {
    return Container(
          width: 100.w,
          height: 15.h,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.w),
                  color: AppColors.green),
              child: Row(
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text(
                      "New Album",
                      style: Styles.regularFontStyle(color: AppColors.white),
                    ),

                      Text(
                      "Happier Than Ever",
                      style: Styles.regularFontStyle(color: AppColors.white),
                    ),

                      Text(
                      "Billie Eilish",
                      style: Styles.regularFontStyle(color: AppColors.white),
                    ),
                    
                  ]),
                 // Image.network(""),
              
                ],
              ),
            );
  }

  Row appBarSearch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: AppColors.iconColor)),
        const Expanded(child: TextField()),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
              color: AppColors.iconColor,
            ))
      ],
    );
  }
}
