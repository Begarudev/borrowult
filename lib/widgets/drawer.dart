import 'package:borrowult/widgets/drawer_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resources/auth_methods.dart';
import '../utils/theme_consts.dart';
import 'custom_piechart.dart';

class DrawerApp extends StatefulWidget {
  const DrawerApp({super.key});

  @override
  _DrawerAppState createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  AuthMethods authMethods = AuthMethods();
  String? profilePictureUrl;

  @override
  void initState() {
    super.initState();
    loadProfilePicture();
  }

  Future<void> loadProfilePicture() async {
    final userId = authMethods.user.uid;
    String? url = await authMethods.getProfilePictureUrl(userId);
    setState(() {
      profilePictureUrl = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: onPrimary,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: "Hi\n",
                    style:
                        TextStyle(fontSize: 40.03, fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                      text: "UserName!",
                      style: TextStyle(
                          fontSize: 41.96, fontWeight: FontWeight.w700))
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                PieChartWidget(),
                if (profilePictureUrl != null)
                  CircleAvatar(
                    radius: 65, // Set the radius as needed
                    backgroundImage: NetworkImage(profilePictureUrl!),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                    text: const TextSpan(
                        text: "2 देन",
                        style: TextStyle(color: lendColor, fontSize: 26))),
                RichText(
                    text: const TextSpan(
                        text: "1 लेन",
                        style: TextStyle(color: borrowColor, fontSize: 26)))
              ],
            ),
            Expanded(
                child: ListView(
              children: [
                DrawerList(
                  icon: "my_posts_icon",
                  text: "My Posts",
                  onTap: () {},
                ),
                DrawerList(
                  icon: "bookmarked_posts_icon",
                  text: "Bookmarked Posts",
                  onTap: () {},
                ),
                DrawerList(
                  icon: "settings_icon",
                  text: "Settings",
                  onTap: () {},
                ),
                DrawerList(
                  icon: "feedback_icon",
                  text: "Feedback",
                  onTap: () {},
                ),
                DrawerList(
                  icon: "donate_icon",
                  text: "Donate",
                  onTap: () {},
                ),
                DrawerList(
                  icon: "developers_icon",
                  text: "Developers",
                  onTap: () {},
                ),
                DrawerList(
                  icon: "signout_icon",
                  text: "Sign Out",
                  onTap: () {},
                ),
                Divider(
                  color: Colors.white,
                  indent: 20,
                  endIndent: 20,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
