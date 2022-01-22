import 'package:clothshop/screens/home/components/productList.dart';
import 'package:clothshop/screens/home/components/slider.dart';
import 'package:clothshop/screens/home/components/topHeader.dart';
import 'package:clothshop/screens/home/components/topHeadline.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _controller;
  List items = [
    {
      "image": 1,
      "name": "Louis T-Shirt",
      "actualPrice": 75,
      "discountPrice": 55,
      "backgroundColor": Colors.blue,
      "colors": [Colors.blue, Colors.black, Colors.red]
    },
    {
      "image": 2,
      "name": "Phillip T-Shirt",
      "actualPrice": 85,
      "discountPrice": 65,
      "backgroundColor": Colors.grey,
      "colors": [Colors.green, Colors.orange, Colors.white]
    },
    {
      "image": 3,
      "name": "Nova T-Shirt",
      "actualPrice": 75,
      "discountPrice": 55,
      "backgroundColor": Colors.black,
      "colors": [Colors.blue, Colors.white, Colors.yellow]
    },
    {
      "image": 4,
      "name": "Money Heist T-Shirt",
      "actualPrice": 105,
      "discountPrice": 95,
      "backgroundColor": Colors.red,
      "colors": [Colors.red, Colors.black, Colors.white]
    },
    {
      "image": 5,
      "name": "Royal T-Shirt",
      "actualPrice": 100,
      "discountPrice": 95,
      "backgroundColor": Colors.blueAccent,
      "colors": [Colors.black, Colors.blue, Colors.red]
    }
  ];

  @override
  void initState() {
    super.initState();

    _controller = new PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TopHeader(),
            SizedBox(
              height: 60,
            ),
            TopHeadline(),
            SizedBox(
              height: 16,
            ),
            ProductList(
              items: items,
            ),
            SizedBox(
              height: 16,
            ),
            HomeSlider(),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () => {}, icon: Icon(EvaIcons.searchOutline)),
              IconButton(onPressed: () => {}, icon: Icon(EvaIcons.home)),
              IconButton(
                  onPressed: () => {}, icon: Icon(EvaIcons.heartOutline)),
            ],
          ),
        ),
      ),
    );
  }
}
