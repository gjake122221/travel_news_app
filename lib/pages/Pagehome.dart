import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/LocalData.dart';
import '../layouts/largecardlayout.dart';
import '../layouts/smallcardlayout.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    var widthofcontext = MediaQuery.of(context).size.width;
    var heightofcontext = MediaQuery.of(context).size.height;
    return SizedBox(
      width: widthofcontext,
      height: heightofcontext,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: SvgPicture.asset(
                    getImage('icons/profile_selected_icon.svg')),
              ),
              title: Text('Welcom Back'),
              subtitle: Text('#DD-00-MM'),
            ),
            SearchBar(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              elevation: MaterialStatePropertyAll(0),
              backgroundColor: MaterialStatePropertyAll(Color(0xFFF3F1F1)),
              hintStyle: MaterialStatePropertyAll(
                TextStyle(color: Color(0x96838383)),
              ),
              hintText: 'Search for article...',
              trailing: <Widget>[
                ElevatedButton(
                  onPressed: () => '',
                  child: SizedBox(
                    width: 30,
                    height: 50,
                    child: SvgPicture.asset(getImage('icons/search_icon.svg')),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('#temp'),
                  Text('#temp'),
                  Text('#temp'),
                  Text('#temp'),
                ],
              ),
            ),
            LargeCardLayout(usersProfile, userPost),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Short For You'),
                      TextButton(onPressed: () => '', child: Text('View All'))
                    ],
                  ),
                  SmallCardLayout(usersProfile, userPost),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
