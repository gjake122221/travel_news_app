import 'package:flutter/material.dart';

import '../data/LocalData.dart';
import 'Page_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var widthofcontext = MediaQuery.of(context).size.width;
    var heightofcontext = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int value) {
            setState(() {
              currentPageIndex = value;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: [
            NavigationDestination(
              icon: DataSets().getImages('home_unselected_icon'),
              selectedIcon: DataSets().getImages('home_selected_icon'),
              label: '',
            ),
            NavigationDestination(
              icon: DataSets().getImages('bookmark_unselected_icon'),
              selectedIcon: DataSets().getImages('bookmark_selected_icon'),
              label: '',
            ),
            NavigationDestination(
              icon: DataSets().getImages('notification_unselected_icon'),
              selectedIcon: DataSets().getImages('notification_selected_icon'),
              label: '',
            ),
            NavigationDestination(
              icon: DataSets().getImages('profile_unselected_icon'),
              selectedIcon: DataSets().getImages('profile_selected_icon'),
              label: '',
            ),
          ],
        ),
        body: <Widget>[
          Page_Home(),
          Container(
            width: widthofcontext,
            height: heightofcontext,
            color: Colors.blue,
          ),
          Container(
            width: widthofcontext,
            height: heightofcontext,
            color: Colors.amber,
          ),
          Container(
            width: widthofcontext,
            height: heightofcontext,
            color: Colors.orange,
          ),
        ][currentPageIndex],
      ),
    );
  }
}
