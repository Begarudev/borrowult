import 'screens/post_borrow_screen.dart';
import 'screens/post_lend_screen.dart';
import 'utils/theme_consts.dart';
import 'package:flutter/material.dart';

class PostTab extends StatelessWidget {
  const PostTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: DefaultTabController(
          length: 2,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Add shadow color
                    offset: Offset(0, 2), // Add vertical offset
                    blurRadius: 4, // Add blur radius
                  ),
                ]),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            child: Scaffold(
              backgroundColor: secondary2,
              body: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      splashBorderRadius: BorderRadius.all(Radius.circular(20)),
                      splashFactory: InkRipple.splashFactory,
                      labelColor: Colors.white,
                      automaticIndicatorColorAdjustment: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Colors.white,
                      padding: EdgeInsets.all(10),
                      tabAlignment: TabAlignment.fill,
                      labelStyle: TextStyle(fontSize: 20),
                      tabs: [
                        Tab(text: 'लेन'), // First Tab
                        Tab(text: 'देन'), // Second Tab
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          BuyTabContent(), // "लेन" tab content
                          SellTabContent(), // "देन" tab content
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
