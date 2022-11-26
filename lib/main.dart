import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/views/favorite/view-model/favorities_view_model.dart';
import 'package:spotify_api/views/favorite/view/favorite.dart';
import 'package:spotify_api/views/home/view-model/home_view_model.dart';
import 'package:spotify_api/views/home/view/home.dart';
import 'package:spotify_api/views/profile/view-model/profile_view_model.dart';
import 'package:spotify_api/views/profile/view/profile_screen.dart';
import 'package:spotify_api/views/search/model-view/search_model_view.dart';
import 'package:spotify_api/views/search/view/search_screen.dart';
import 'package:spotify_api/views/widgets/bottom_navigation.dart';
import 'package:spotify_api/views/widgets/bottom_viewModel.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomeViewModel>(
          create: (_) => HomeViewModel()),
      ChangeNotifierProvider<ProfileViewModel>(
          create: (_) => ProfileViewModel()),
      ChangeNotifierProvider<BottomViewModel>(create: (_) => BottomViewModel()),
      ChangeNotifierProvider<FavoritiesViewModel>(
          create: (_) => FavoritiesViewModel()),

                ChangeNotifierProvider<SearchViewModel>(
          create: (_) => SearchViewModel())
    ],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner:false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> widgetList = [
    const Home(),
    const SearchScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomWidget(),
      body: Consumer(
        builder: (context, BottomViewModel value, child) =>
            widgetList[value.customSelectedIndex],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
