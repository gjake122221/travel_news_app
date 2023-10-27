import 'package:flutter/material.dart';

import '../data/LocalData.dart';
import 'Pagehome.dart';

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
              icon: DataSets().getImage('icons/home_unselected_icon', 'svg'),
              selectedIcon:
                  DataSets().getImage('icons/home_selected_icon', 'svg'),
              label: '',
            ),
            NavigationDestination(
              icon:
                  DataSets().getImage('icons/bookmark_unselected_icon', 'svg'),
              selectedIcon:
                  DataSets().getImage('icons/bookmark_selected_icon', 'svg'),
              label: '',
            ),
            NavigationDestination(
              icon: DataSets()
                  .getImage('icons/notification_unselected_icon', 'svg'),
              selectedIcon: DataSets()
                  .getImage('icons/notification_selected_icon', 'svg'),
              label: '',
            ),
            NavigationDestination(
              icon: DataSets().getImage('icons/profile_unselected_icon', 'svg'),
              selectedIcon:
                  DataSets().getImage('icons/profile_selected_icon', 'svg'),
              label: '',
            ),
          ],
        ),
        body: <Widget>[
          PageHome(),
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
