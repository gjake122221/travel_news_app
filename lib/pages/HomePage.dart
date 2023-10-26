import 'package:flutter/material.dart';

import '../data/LocalData.dart';

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
    var getdata = DataSets();
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
              icon: getdata.getImages('home_unselected_icon'),
              selectedIcon: getdata.getImages('home_selected_icon'),
              label: '',
            ),
            NavigationDestination(
              icon: getdata.getImages('bookmark_unselected_icon'),
              selectedIcon: getdata.getImages('bookmark_selected_icon'),
              label: '',
            ),
            NavigationDestination(
              icon: getdata.getImages('notification_unselected_icon'),
              selectedIcon: getdata.getImages('notification_selected_icon'),
              label: '',
            ),
            NavigationDestination(
              icon: getdata.getImages('profile_unselected_icon'),
              selectedIcon: getdata.getImages('profile_selected_icon'),
              label: '',
            ),
          ],
        ),
        body: <Widget>[
          Container(
            width: widthofcontext,
            height: heightofcontext,
            color: Colors.red,
          ),
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
