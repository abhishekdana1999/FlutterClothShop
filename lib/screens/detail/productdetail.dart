import 'package:clothshop/screens/home/components/topHeader.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int selectedSize = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController _pageController = new PageController();
    int activeIndex = 1;
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                activeIndex = value;
              });
            },
            children: List.generate(
              3,
              (index) => Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage(
                      "images/detail" + (index + 1).toString() + ".jfif"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_getHeader(), _getdescriptionBox(_pageController)],
            ),
          )
        ],
      ),
    ));
  }

  Widget _getHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () => {Navigator.pop(context)},
              icon: Icon(EvaIcons.arrowBackOutline)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => {}, icon: Icon(EvaIcons.heartOutline)),
              Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.circular(50))),
                  ),
                  IconButton(
                      onPressed: () => {},
                      icon: Icon(
                        EvaIcons.shoppingBagOutline,
                        size: 28,
                        color: Colors.black87,
                      ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _getdescriptionBox(_pageController) {
    return Container(
      child: Column(
        children: [
          _getPagination(_pageController),
          SizedBox(
            height: 16,
          ),
          _getDescriptionBox(),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _getPagination(_pageController) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.only(top: 24, right: 16, left: 200),
        child: Positioned(
          right: 0,
          child: SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            axisDirection: Axis.horizontal,
            effect: ExpandingDotsEffect(
                spacing: 8.0,
                radius: 4.0,
                dotWidth: 20.0,
                dotHeight: 5.0,
                paintStyle: PaintingStyle.fill,
                strokeWidth: 1,
                dotColor: Colors.blueAccent.withOpacity(0.4),
                activeDotColor: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _getDescriptionBox() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getDescriptionNameAndColors(),
            _getDescriptionSize(),
            _getAddToCartAndPrice()
          ],
        ),
      ),
    );
  }

  Widget _getDescriptionNameAndColors() {
    List colors = [Colors.blue, Colors.red, Colors.green];
    int selectedColor = 2;
    return Padding(
      padding: EdgeInsets.only(right: 24, left: 24, top: 24, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "PHILLIP TOP",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                  colors.length,
                  (cIndex) => Container(
                        height: 20,
                        width: 20,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: colors[cIndex].withOpacity(0.7),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.05))
                            ],
                            borderRadius: BorderRadius.circular(100)),
                      )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getDescriptionSize() {
    List sizes = ['XS', 'S', 'M', 'L', 'XL'];
    return Padding(
        padding: EdgeInsets.only(right: 24, left: 24, top: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SIZE",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                    sizes.length,
                    (index) => GestureDetector(
                          onTap: () => {
                            setState(() {
                              selectedSize = index;
                            })
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: selectedSize == index
                                    ? Colors.black
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                sizes[index],
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: selectedSize == index
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                            ),
                          ),
                        )))
          ],
        ));
  }

  Widget _getAddToCartAndPrice() {
    return Padding(
      padding: EdgeInsets.only(
        right: 24,
        left: 24,
        top: 24,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.transparent,
              width: 100,
              child: Center(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text(
                        "-30%",
                        style: GoogleFonts.poppins(
                            color: Colors.red[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$77",
                        style: GoogleFonts.poppins(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "\$57",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              )),
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width / 2.8,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Center(
                child: Text("Add To Bag",
                    style: GoogleFonts.poppins(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
