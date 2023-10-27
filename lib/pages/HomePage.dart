import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              icon:
                  SvgPicture.asset(getImage('icons/home_unselected_icon.svg')),
              selectedIcon:
                  SvgPicture.asset(getImage('icons/home_selected_icon.svg')),
              label: '',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                  getImage('icons/bookmark_unselected_icon.svg')),
              selectedIcon: SvgPicture.asset(
                  getImage('icons/bookmark_selected_icon.svg')),
              label: '',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                  getImage('icons/notification_unselected_icon.svg')),
              selectedIcon: SvgPicture.asset(
                  getImage('icons/notification_selected_icon.svg')),
              label: '',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                  getImage('icons/profile_unselected_icon.svg')),
              selectedIcon:
                  SvgPicture.asset(getImage('icons/profile_selected_icon.svg')),
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
