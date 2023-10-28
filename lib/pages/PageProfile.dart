import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data/LocalData.dart';

class PageProfile extends StatelessWidget {
  PageProfile(this.userID, this.user, this.post);
  final String userID;
  final List<Map<String, String>> user;
  final List<Map<String, String>> post;
  int gatIndex() {
    var index = 0;
    for (var userid in user) {
      if ('${userid['userid']}' == userID) {
        break;
      }
      index++;
    }
    return index;
  }

  List<Map<String, String>> selectPost() {
    List<Map<String, String>> getPost = [];
    for (var postid in post) {
      if ('${postid['userid']}' == userID) {
        getPost.add(postid);
      }
    }
    return getPost;
  }

  @override
  Widget build(BuildContext context) {
    var widthofcontext = MediaQuery.of(context).size.width;
    var index = gatIndex();
    var getUserPost = selectPost();
    //'${getUserPost[index]['name']}'
    var makeCard = List.generate(
      getUserPost.length,
      (index) => Card(
        child: ListTile(
          leading: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset('${getUserPost[index]['Image']}'),
          ),
          title: Text('${getUserPost[index]['name']}'),
          subtitle: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              children: [
                SvgPicture.asset(getImage('icons/calendar_icon.svg')),
                Text(
                  ' ${getUserPost[index]['date']}',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
            VerticalDivider(),
            Row(
              children: [
                SvgPicture.asset(getImage('icons/time_icon.svg')),
                Text(
                  '${getUserPost[index]['time']}',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  BackButton(
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text('Profile')
                ],
              ),
              ListTile(
                leading: CircleAvatar(
                  child: SvgPicture.asset(
                      getImage('icons/profile_selected_icon.svg')),
                ),
                title: Text('${user[index]['fname']} ${user[index]['lname']}'),
                subtitle: Text('Author & Writer'),
                trailing: ElevatedButton(
                  child: Text('Follow'),
                  onPressed: () => '',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('${user[index]['description']}'),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                  color: Color(0xFF19202D),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: SizedBox(
                    width: widthofcontext,
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${user[index]['followers']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Followers',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        VerticalDivider(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${user[index]['posts']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Posts',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        VerticalDivider(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${user[index]['rating']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Rating',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${user[index]['fname']}\'s Post',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () => '', child: Text('View All'))
                ],
              ),
              Column(
                children: makeCard,
              )
            ],
          ),
        ),
      ),
    );
  }
}
