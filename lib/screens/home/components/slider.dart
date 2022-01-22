import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _controller = new PageController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 180,
        margin: EdgeInsets.only(top: 24),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.08),
            borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(top: 24, right: 16, left: 120),
                child: Positioned(
                  right: 0,
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: ExpandingDotsEffect(
                        spacing: 8.0,
                        radius: 4.0,
                        dotWidth: 10.0,
                        dotHeight: 5.0,
                        paintStyle: PaintingStyle.fill,
                        strokeWidth: 1,
                        dotColor: Colors.blueAccent.withOpacity(0.2),
                        activeDotColor: Colors.black),
                  ),
                ),
              ),
            ),
            Stack(
              overflow: Overflow.visible,
              children: [
                Positioned(
                  top: -30,
                  left: -20,
                  child: Image(
                    image: AssetImage("images/girlback.png"),
                    height: 200,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                Positioned(
                    top: 80,
                    left: 120,
                    right: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SUMMER SPECIAL COLLECTION",
                          style:
                              GoogleFonts.lato(color: Colors.blueAccent[100]),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Get",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                TextSpan(text: "  "),
                                TextSpan(
                                    text: "30%",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                        fontSize: 18)),
                                TextSpan(text: "  "),
                                TextSpan(
                                    text: "OFF",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                TextSpan(text: "  "),
                              ]),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 24,
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
