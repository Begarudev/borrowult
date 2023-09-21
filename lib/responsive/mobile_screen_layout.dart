import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../borrow_tab.dart';
import '../lend_tab.dart';
import '../post_tab.dart';
import '../utils/theme_consts.dart';
import 'package:borrowult/resources/auth_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/drawer.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(166, 32, 83, 149),
        surfaceTintColor: Colors.black,
        elevation: 10,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ),
        title: const Text('My Borrow App'),
      ),
      drawer: DrawerApp(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,

      ///Bottom Navigation Bar Implementation
      bottomNavigationBar: NavigationBar(
        backgroundColor: onPrimary,
        // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: const Color.fromARGB(0, 0, 0, 0),
        surfaceTintColor: Colors.transparent,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset("assets/lend_tab.svg"),
            label: 'Lend',
          ),
          NavigationDestination(
              icon: Container(
                child: const Icon(
                  Icons.add_box_rounded,
                  color: secondary,
                  size: 25,
                ),
                color: Colors.white,
              ),
              label: 'Post'),
          NavigationDestination(
              icon: SvgPicture.asset("assets/borrow_tab.svg"), label: "label")
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      body: [
        const LendTab(),
        const PostTab(),
        const BorrowTab(),

        // PostTab(),
        // BorrowTab(),
      ][currentPageIndex],
    );
  }
}
