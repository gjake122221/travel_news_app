import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/LocalData.dart';

class LargeCardLayout extends StatelessWidget {
  LargeCardLayout(this.user, this.post, this.index);
  final List<Map<String, String>> user;
  final List<Map<String, String>> post;
  final int index;

  String getUserName() {
    var name = '';
    for (var userid in user) {
      if (userid['userid'].toString() == post[index]['userid']) {
        name = '${userid['fname']} ${userid['lname']}';
      }
    }
    return name;
  }

  @override
  Widget build(BuildContext context) {
    double bigcardWidth = 220;
    double bigcardHeight = 250;
    double imageWidth = 200;
    double imageHeight = 120;
    return Card(
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
                getUserName(),
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
}

var largeCardLayout = List.generate(
    userPost.length, (index) => LargeCardLayout(usersProfile, userPost, index));
