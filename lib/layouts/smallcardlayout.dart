import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/LocalData.dart';

class SmallCardLayout extends StatelessWidget {
  SmallCardLayout(this.post, this.index);
  final List<Map<String, String>> post;
  final int index;

  @override
  Widget build(BuildContext context) {
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
                      '${post[index]['Image']}',
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
                    '${post[index]['name']}',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    '${post[index]['date']}',
                    style: TextStyle(fontSize: 10),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(getImage('icons/eye_icon.svg')),
                      Text(
                        ' ${post[index]['popularity']}',
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
}

var smallCardLayout =
    List.generate(userPost.length, (index) => SmallCardLayout(userPost, index));
