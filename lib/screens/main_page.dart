import 'package:flutter/material.dart';
import 'package:fruit_market_app/data/vegetables.dart';
import 'package:fruit_market_app/models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fruit_market_app/data/fruits.dart';
import 'package:fruit_market_app/screens/widgets/customcontainer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String heading1 = "Organic Vegetables",
      heading2 = "Mixed Vegetables Pack",
      heading3 = "Allium Vegetables",
      heading4 = "Root Vegetables";
  // List head=[heading1,heading2,heading3,heading4];
  String subtitle0 = "Organic Vegetables",
      subtitle1 = "Mixed Vegetables Pack",
      subtitle2 = "Allium Vegetables",
      subtitle3 = "Root Vegetables";
  var per0 = 20, per1 = 10, per2 = 20, per3 = 5;
  var row = [
    organicVegetables,
    mixedVegetables,
    alliumVegetables,
    rootVegetables
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Fruit Market",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
          ],
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
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
                    margin: const EdgeInsets.only(left: 40, right: 40, top: 10),
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          label: const Text(
                            'search',
                            style: TextStyle(color: Colors.black),
                          ),
                          prefixIcon: const Icon(Icons.search),
                          iconColor: Colors.white54,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          Vegetables v = Vegetables();
                          heading1 = v.heading[0];
                          heading2 = v.heading[1];
                          heading3 = v.heading[2];
                          heading4 = v.heading[3];
                          subtitle0 = v.subtitle[0];
                          subtitle1 = v.subtitle[1];
                          subtitle2 = v.subtitle[2];
                          subtitle3 = v.subtitle[3];
                          per0 = v.per[0];
                          per1 = v.per[1];
                          per2 = v.per[2];
                          per3 = v.per[3];
                          row = [
                            organicVegetables,
                            mixedVegetables,
                            alliumVegetables,
                            rootVegetables
                          ];
                        });
                      },
                      child: Text(
                        "Vegetables",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          Fruit f = Fruit();
                          heading1 = f.heading[0];
                          heading2 = f.heading[1];
                          heading3 = f.heading[2];
                          heading4 = f.heading[3];
                          subtitle0 = f.subtitle[0];
                          subtitle1 = f.subtitle[1];
                          subtitle2 = f.subtitle[2];
                          subtitle3 = f.subtitle[3];
                          per0 = f.per[0];
                          per1 = f.per[1];
                          per2 = f.per[2];
                          per3 = f.per[3];

                          row = [
                            organicFruits,
                            mixedFruits,
                            stoneFruits,
                            melons
                          ];
                        });
                      },
                      child: Text(
                        "Fruits",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          DryFruits D = DryFruits();
                          heading1 = D.heading[0];
                          heading2 = D.heading[1];
                          heading3 = D.heading[2];
                          heading4 = D.heading[3];
                          subtitle0 = D.subtitle[0];
                          subtitle1 = D.subtitle[1];
                          subtitle2 = D.subtitle[2];
                          subtitle3 = D.subtitle[3];
                          per0 = D.per[0];
                          per1 = D.per[1];
                          per2 = D.per[2];
                          per3 = D.per[3];

                          row = [
                            organicFruits,
                            mixedFruits,
                            stoneFruits,
                            melons
                          ];
                        });
                      },
                      child: Text(
                        "Dry Fruits",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 620,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    List head = [heading1, heading2, heading3, heading4];
                    List subt = [subtitle0, subtitle1, subtitle2, subtitle3];
                    List percentage = [per0, per1, per2, per3];

                    return SizedBox(
                        height: 270,
                        // alignment: AlignmentDirectional(3,4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("${head[index]}  ",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                Text(
                                  "(${percentage[index]}% off)",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.green),
                                )
                              ],
                            ),
                            Text(
                              "${subt[index]}",
                              style: GoogleFonts.poppins(fontSize: 12),
                            ),
                            SizedBox(
                              height: 200,
                              width: 390,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int count) {
                                  return SizedBox(
                                      width: 150,
                                      child: Column(
                                        children: [
                                          TapContainer(
                                            item: row[index][count],
                                          ),
                                        ],
                                      ));
                                },
                                itemCount: row[index].length,
                              ),
                            )
                          ],
                        ));
                  },
                  itemCount: row.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
