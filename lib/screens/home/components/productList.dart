import 'package:clothshop/screens/detail/productdetail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductList extends StatelessWidget {
  final items;
  ProductList({Key? key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              items.length, (index) => _productCard(index, context)),
        ),
      ),
    );
  }

  Widget _productCard(index, context) {
    print(items[index]);
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      child: Stack(
        children: [
          new Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            padding: new EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 8,
                right: 8.0,
                left: 8.0),
            child: new Container(
              height: 250.0,
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: items[index]["backgroundColor"].withOpacity(0.07),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    items[index]["name"],
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$" + items[index]["actualPrice"].toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.grey[500],
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "\$" + items[index]["discountPrice"].toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                          items[index]["colors"].length,
                          (cIndex) => Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: items[index]["colors"][cIndex]
                                        .withOpacity(0.7),
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
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetail()),
              )
            },
            child: Positioned(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Image(
                        image: AssetImage("images/hanger.png"),
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                  Center(
                    child: Image(
                      image: AssetImage("images/" +
                          items[index]["image"].toString() +
                          ".png"),
                      fit: BoxFit.cover,
                      height: 280,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
