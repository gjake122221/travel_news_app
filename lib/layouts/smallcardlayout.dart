import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/LocalData.dart';

class SmallCardLayout extends StatelessWidget {
  SmallCardLayout(this.post);
  final List<Map<String, String>> post;

  List<Map<String, String>> selectPost() {
    List<Map<String, String>> popularPost = [];
    for (var post in userPost) {
      if (int.parse('${post['popularity']}') >= 6000) {
        popularPost.add(post);
      }
    }
    return popularPost;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> smallCardLayout = List.empty();
    var popularPost = selectPost();
    Widget cardLayout(index) {
      double smallcardWidth = 200;
      double smallcardHeight = 70;
      double imageWidth = 70;
      double imageHeight = 60;
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          width: smallcardWidth,
          height: smallcardHeight,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: imageWidth,
                  height: imageHeight,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        '${popularPost[index]['Image']}',
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${popularPost[index]['name']}',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      '${popularPost[index]['date']}',
                      style: TextStyle(fontSize: 10),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(getImage('icons/eye_icon.svg')),
                        Text(
                          ' ${popularPost[index]['popularity']}',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    smallCardLayout =
        List.generate(popularPost.length, (index) => cardLayout(index));

    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: smallCardLayout,
        ),
      ),
    );
  }
}
