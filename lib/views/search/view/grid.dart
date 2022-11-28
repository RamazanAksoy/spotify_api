import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/utils/helpers/text_styles.dart';
import 'package:spotify_api/views/search/model-view/search_model_view.dart';

class GridCategories extends StatelessWidget {
  const GridCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, SearchViewModel value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Categories",style:Styles.titleStyle(fontSize: 18.sp),),
            Container(
              width: 100.w,
              child: value.isLoadingCategories == false
                  ? GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 5 / 3,
                          crossAxisSpacing: 4.w,
                          mainAxisSpacing: 2.h),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                              border: Border.all(width: 2.sp, color: Colors.black),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    value.categoriesModel!.categories!.items![index].icons!.isEmpty?"":
                                      "${value.categoriesModel!.categories!.items![index].icons![0].url}"),
                                  fit: BoxFit.cover)),
                          child: Text(
                            "${value.categoriesModel!.categories!.items![index].name}",
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        );
                      })
                  : Container(),
            ),
          ],
        );
      },
    );
  }
}