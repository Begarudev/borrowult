import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerList extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback? onTap;

  const DrawerList({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        child: Row(
          children: <Widget>[
            SvgPicture.asset("assets/${icon}.svg"),
            SizedBox(width: 10.0),
            RichText(
                text: TextSpan(
                    text: text,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400))),
          ],
        ),
      ),
    );
  }
}
