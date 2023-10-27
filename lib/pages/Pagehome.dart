import 'package:flutter/material.dart';

import '../data/LocalData.dart';

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
                child:
                    DataSets().getImage('icons/profile_selected_icon', 'svg'),
              ),
              title: Text('Welcom Back'),
              subtitle: Text('#DD-00-mm'),
            ),
            SearchBar(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
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
                    child: DataSets().getImage('icons/search_icon', 'svg'),
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
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      child: SizedBox(
                        width: 200,
                        height: 250,
                      ),
                    ),
                    Card(
                      child: SizedBox(
                        width: 200,
                        height: 250,
                      ),
                    ),
                    Card(
                      child: SizedBox(
                        width: 200,
                        height: 250,
                      ),
                    ),
                    Card(
                      child: SizedBox(
                        width: 200,
                        height: 250,
                      ),
                    )
                  ],
                ),
              ),
            ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Card(
                            child: SizedBox(
                              width: 200,
                              height: 80,
                            ),
                          ),
                          Card(
                            child: SizedBox(
                              width: 200,
                              height: 80,
                            ),
                          ),
                          Card(
                            child: SizedBox(
                              width: 200,
                              height: 80,
                            ),
                          ),
                          Card(
                            child: SizedBox(
                              width: 200,
                              height: 80,
                            ),
                          )
                        ],
                      ),
                    ),
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
