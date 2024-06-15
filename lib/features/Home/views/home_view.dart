import 'package:flutter/material.dart';
import 'package:ican_to/core/functions/building_nav_bar_item.dart';
import 'package:ican_to/features/Home/widgets/home_view_body.dart';
import 'package:ican_to/features/aboutUs/views/about_us_view.dart';
import 'package:ican_to/features/favList/views/fav_list_view.dart';
import 'package:ican_to/features/profile/presentation/views/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static String id = "HomeView";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> bodies = [
    const HomeViewBody(),
    const FavListView(),
    const AboutUsView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xff3CC563),
          unselectedItemColor: const Color(0xff9CA3AF),
          currentIndex: currentIndex,
          onTap: (int newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: navBarItems,
        ),
        body: bodies[currentIndex],
      ),
    );
  }
}

List<BottomNavigationBarItem> navBarItems = [
  navBaritem("Home", Icons.home_filled),
  navBaritem("Fav List", Icons.favorite_rounded),
  navBaritem("About Us", Icons.groups),
  navBaritem("Profile", Icons.person)
];
