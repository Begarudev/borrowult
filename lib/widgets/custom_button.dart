import 'package:borrowult/utils/theme_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: primary,
          minimumSize: Size(double.infinity, 50),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(73)),
          shadowColor: Color.fromARGB(255, 11, 29, 48),
          elevation: 0),
      // backgroundColor: MaterialStatePropertyAll(primary),
      // shadowColor: MaterialStatePropertyAll(Colors.black)),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset("assets/Group 48096022.svg"),
          Text(
            text,
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
