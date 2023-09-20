import 'utils/theme_consts.dart';
import 'package:flutter/material.dart';

class LendRequest {
  final String username;
  final String itemName;
  final String itemDescription;
  bool isBookmarked;

  LendRequest({
    required this.username,
    required this.itemName,
    required this.itemDescription,
    this.isBookmarked = false,
  });
}

class LendTab extends StatefulWidget {
  const LendTab({super.key});

  @override
  _LendTabState createState() => _LendTabState();
}

class _LendTabState extends State<LendTab> {
  List<LendRequest> lendRequests = [
    LendRequest(
      username: 'user1',
      itemName: 'Item 1',
      itemDescription: 'Description for Item 1',
    ),
    LendRequest(
      username: 'user2',
      itemName: 'Item 2',
      itemDescription: 'Description for Item 2',
    ),
    // Add more LendRequest objects here
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primary,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: lendRequests.length,
        itemBuilder: (context, index) {
          return Card(
            color: const Color.fromRGBO(20, 66, 114, 1),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0),
              borderRadius: BorderRadius.circular(23),
            ),
            margin: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(20, 66, 144, 1),
                border: Border.all(style: BorderStyle.none),
                borderRadius: const BorderRadius.all(Radius.circular(23)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Profile Picture (you can replace this with your image widget)
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 15, // Adjust the size as needed
                          backgroundColor:
                          Colors.white, // Customize the background color
                          child: Icon(
                            Icons.person, // Replace with your profile picture
                            color: Colors.blue, // Customize the icon color
                            size: 15, // Customize the icon size
                          ),
                        ),
                      ),
                      const SizedBox(
                          width:
                          8.0), // Add spacing between the profile picture and username
                      Text(
                        'Username: ${lendRequests[index].username}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 10000,
                    color: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Item: ${lendRequests[index].itemName}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text('About: ${lendRequests[index].itemDescription}'),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: lendRequests[index].isBookmarked
                          ? const Icon(
                        Icons.bookmark,
                        color: Colors.white,
                      )
                          : const Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          lendRequests[index].isBookmarked =
                          !lendRequests[index].isBookmarked;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
