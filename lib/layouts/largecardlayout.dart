import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/LocalData.dart';

class LargeCardLayout extends StatelessWidget {
  LargeCardLayout(this.user, this.post);
  final List<Map<String, String>> user;
  final List<Map<String, String>> post;

  String getUserName(index) {
    var name = '';
    for (var userid in user) {
      if ('${userid['userid']}' == '${post[index]['userid']}') {
        name = '${userid['fname']} ${userid['lname']}';
      }
    }
    return name;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> largeCardLayout = [];
    Widget cardLayout(index) {
      double bigcardWidth = 220;
      double bigcardHeight = 250;
      double imageWidth = 200;
      double imageHeight = 120;
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          width: bigcardWidth,
          height: bigcardHeight,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: imageWidth,
                  height: imageHeight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      '${post[index]['Image']}',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
                child: SizedBox(
                  width: double.infinity,
                  height: 32,
                  child: Text(
                    '${post[index]['title']}',
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: SvgPicture.asset(
                    getImage('icons/profile_selected_icon.svg'),
                  ),
                ),
                title: Text(
                  getUserName(index),
                  style: TextStyle(fontSize: 12),
                ),
                subtitle: Text('${post[index]['date']}',
                    style: TextStyle(fontSize: 10)),
                trailing: SvgPicture.asset(
                  getImage('icons/share_icon.svg'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    largeCardLayout =
        List.generate(userPost.length, (index) => cardLayout(index));

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: largeCardLayout,
        ),
      ),
    );
  }
}
