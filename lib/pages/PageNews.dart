import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data/LocalData.dart';

class PageNews extends StatelessWidget {
  PageNews(this.name, this.title, this.description, this.picture);
  final String name;
  final String title;
  final String description;
  final String picture;

  @override
  Widget build(BuildContext context) {
    var widthofcontext = MediaQuery.of(context).size.width;
    var heightofcontext = MediaQuery.of(context).size.height;
    Widget pagelayout() {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: widthofcontext,
                      height: heightofcontext / 2,
                      child: ClipRRect(
                        child: Image.asset(
                          picture,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: SvgPicture.asset(
                              getImage('icons/arrow_back_icon.svg'),
                            ),
                          ),
                          IconButton(
                            onPressed: () => print('Hello'),
                            icon: SvgPicture.asset(
                              getImage('icons/bookmark_white_icon.svg'),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: Text(title),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: SvgPicture.asset(
                                getImage('icons/profile_selected_icon.svg')),
                          ),
                          Text(' $name'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        description,
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    return pagelayout();
  }
}
