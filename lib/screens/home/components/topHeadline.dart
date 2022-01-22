import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopHeadline extends StatelessWidget {
  const TopHeadline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedSortValue = 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover",
                style:
                    GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Explore the new shirts ❄️",
                style: GoogleFonts.lato(fontSize: 18, color: Colors.black54),
              ),
            ],
          ),
          DropdownButton(
            icon: Icon(Icons.keyboard_arrow_down_outlined),
            items: [
              DropdownMenuItem(
                child: Text(
                  "Sort By",
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                value: 0,
              ),
              DropdownMenuItem(
                child: Text("Price",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("Review",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                value: 2,
              ),
              DropdownMenuItem(
                child: Text("Recent",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                value: 3,
              )
            ],
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold, color: Colors.black),
            value: selectedSortValue,
            underline: Text(""),
          )
        ],
      ),
    );
    ;
  }
}
