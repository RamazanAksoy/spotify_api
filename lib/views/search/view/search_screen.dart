import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/base/base_loading.dart';
import 'package:spotify_api/core/constans/colors.dart';
import 'package:spotify_api/utils/helpers/text_styles.dart';
import 'package:spotify_api/views/search/model-view/search_model_view.dart';

import '../../favorite/view/favorite.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            appbarWidget(padding),
            const SizedBox(
              height: 15,
            ),
            searchTextField(),
            const SizedBox(
              height: 10,
            ),

            
            Consumer(builder: (context,SearchViewModel value, child) => BaseLoadingShimmer(loadingWidget: ArtistAndSongsLoadingWidget(), currentWidget: ArtistAndSongsCurrentWidget(), isLoading: value.isLoadingSearch),)




          ],
        ),
      ),
    );
  }

  Widget ArtistAndSongsLoadingWidget(){
    return    Column(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Artists",
              style:
              Styles.titleStyle(fontSize: 17.sp, color: Colors.black87)),
          SizedBox(
            width: 100.w,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 1.h),
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  height: 5.h,
                  padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(2.w)),
                    margin: EdgeInsets.only(bottom: 1.h),

                );
              },
            ),
          ),
        ],
      ),
      SizedBox(
        height: 3.h,
      ),
      Text("Songs",
          style:
          Styles.titleStyle(fontSize: 17.sp, color: Colors.black87)),
      SizedBox(
        width: 100.w,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 1.h),
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: 5.h,
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(
                          0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(2.w)),
              margin: EdgeInsets.only(bottom: 1.h),

            );
          },
        ),
      ),
    ],);
  }

  Widget ArtistAndSongsCurrentWidget(){
    return    Column(children: [
      searchArtisList(),
      SizedBox(
        height: 3.h,
      ),
      searchSongList()
    ],);
  }

  Widget searchSongList() {
    return Consumer(
      builder: (context, SearchViewModel value, child) => value.isLoadingSearch
          ? Container()
          : Column(
            children: [
                     Text("Songs",
                style:
                    Styles.titleStyle(fontSize: 17.sp, color: Colors.black87)),
              SizedBox(
                  width: 100.w,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 1.h),
                    itemCount: value.searchModel!.tracks!.items2!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(2.w)),
                        margin: EdgeInsets.only(bottom: 1.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    value.searchModel!.tracks!.items2![index].name
                                        .toString(),
                                    style: Styles.titleStyle(),
                                  )
                                ],
                              ),
                              const Icon(Icons.keyboard_arrow_right_outlined)
                            ]),
                      );
                    },
                  ),
                ),
            ],
          ),
    );
  }

  Widget searchArtisList() {
    return Consumer(
      builder: (context, SearchViewModel value, child) => value.isLoadingSearch
          ? Container()
          : Column(
            children: [
                 Text("Artists",
                style:
                    Styles.titleStyle(fontSize: 17.sp, color: Colors.black87)),
              SizedBox(
                  width: 100.w,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 1.h),
                    itemCount: value.searchModel!.artists!.items!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Bounceable(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FavoriteScreen(
                                    id: value
                                        .searchModel!.artists!.items![index].id),
                              ));
                        },
                        child: Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(2.w)),
                          margin: EdgeInsets.only(bottom: 1.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 10.w,
                                      height: 10.w,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          image: DecorationImage(
                                              image: NetworkImage(value
                                                      .searchModel!
                                                      .artists!
                                                      .items![index]
                                                      .images!
                                                      .isEmpty
                                                  ? ""
                                                  : value.searchModel!.artists!
                                                      .items![index].images![0].url
                                                      .toString()),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.circular(5.w)),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      value.searchModel!.artists!.items![index].name
                                          .toString(),
                                      style: Styles.titleStyle(),
                                    )
                                  ],
                                ),
                                const Icon(Icons.keyboard_arrow_right_outlined)
                              ]),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
    );
  }

  Container searchTextField() {
    return Container(
      width: double.infinity,
      height: 50,
      child: TextFormField(
        controller: _textEditingController,
        decoration: InputDecoration(
          prefixIconColor: Colors.black,
          hoverColor: Colors.black,
          fillColor: Colors.grey.shade300,
          iconColor: Colors.black,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none,
          ),
          hintText: 'Artist, songs, or podcasts',
          hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
          prefixIcon: Bounceable(
            onTap: () {
              Provider.of<SearchViewModel>(context, listen: false)
                  .getSearch(search: _textEditingController.text);
            },
            child: const Icon(
              Icons.search,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }

  Container appbarWidget(EdgeInsets padding) {
    return Container(
      margin: EdgeInsets.only(top: padding.top),
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("Search", style: Styles.titleStyle(fontSize: 18.sp)),
        Bounceable(
            onTap: () {},
            child: SvgPicture.asset("assets/more-vertical.svg",
                color: AppColors.black)),
      ]),
    );
  }


}
