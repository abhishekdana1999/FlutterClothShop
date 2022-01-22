import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 80,
          width: 40,
          padding: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Icon(
              Icons.change_history_rounded,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.short_text_outlined,
                    size: 28,
                    color: Colors.black87,
                  )),
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
          ),
        )
      ],
    );
  }
}
