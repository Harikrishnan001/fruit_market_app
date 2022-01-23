import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            title: Text(
              "Fruit Market",
              style: GoogleFonts.anton(color: Colors.white, fontSize: 25),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
            ],
            backgroundColor: Colors.green,
            elevation: 0,
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 30,
                      color: Colors.green,
                    ),
                    Container(
                      height: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
                Container(
                  // color: Colors.white,
                  margin: EdgeInsets.only(left: 40, right: 40, top: 10),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        label: Text(
                          'search',
                          style: TextStyle(color: Colors.black),
                        ),
                        prefixIcon: Icon(Icons.search),
                        iconColor: Colors.white54,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Vegetables",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Fruits",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Dry Fruits",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 550,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 250,
                      // alignment: AlignmentDirectional(3,4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Heading $index  (per% off)",
                          ),
                          Text("Subtitle $index"),
                          Container(
                            height: 100,
                            width: 350,
                            child: 
                               ListView.builder(
                              scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int count) {
                                  return Container(width:30,child :Text("$count"));
                                },
                                itemCount: 5,
                              ),
                            
                          )
                        ],
                      ));
                },
                itemCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
