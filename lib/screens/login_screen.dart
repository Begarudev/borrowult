import 'package:borrowult/widgets/custom_button.dart';
import 'package:borrowult/resources/auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/app_logo.png",
              height: 176.04,
            ),
            SvgPicture.asset("assets/BORROW.svg"),
            Stack(children: <Widget>[
              Image.asset(
                "assets/Vector 1.png",
                width: double.infinity,
              ),
              Image.asset(
                "assets/Vector 2.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(51, 150, 51, 0),
                width: double.infinity,
                // height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Log in to your Account",
                      style: TextStyle(fontSize: 25.9),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                      text: 'Login with Google',
                      onPressed: () async {
                        bool res = await _authMethods.signInWithGoogle(context);
                        if (res) {
                          Navigator.pushNamed(context, '/home');
                        }
                      },
                    ),
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
