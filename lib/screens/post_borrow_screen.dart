import 'package:borrowult/utils/theme_consts.dart';
import 'package:borrowult/widgets/textform_input.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:borrowult/widgets/custom_popmenu_button.dart';
import 'package:flutter_svg/svg.dart';

class SellTabContent extends StatefulWidget {
  const SellTabContent({Key? key});

  @override
  _SellTabContentState createState() => _SellTabContentState();
}

class _SellTabContentState extends State<SellTabContent> {
  String _selectedCategory = 'For Sale'; // Default category

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFormWidget(
              textHint: "Item Title(Keep it short)......",
              maxLines: 1,
              controller: _titleController),
          const SizedBox(
            height: 10,
          ),
          TextFormWidget(
              textHint: "Item Description.......",
              maxLines: 5,
              controller: _descriptionController),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Text("Post the item For:     "),
              PopMenuCustom(
                  choice1: "   Sale              ",
                  choice2: "   Rent              "),
              // const SizedBox(height:,)
            ],
          ),
          SizedBox(
            height: 15,
          ),

          // Add your image upload widget here
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: primary, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Upload Your Image",
                  style: TextStyle(fontSize: 17),
                ),
                const Text(
                  "Maximum 100 KB image size allowed",
                  style: TextStyle(fontSize: 7, color: Colors.white54),
                ),
                DottedBorder(
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(20),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                            "assets/clarity_upload-cloud-line.svg"),
                        const Text(
                          "Select Image to Upload",
                          style: TextStyle(fontSize: 7, color: Colors.white54),
                        ),
                        const Text(
                          "OR",
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/Ellipse 3.svg",
                            ),
                            SvgPicture.asset("assets/camera.svg")
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(20, 23)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all(Color.fromRGBO(13, 147, 147, 1))),
            onPressed: () {
              // Handle the post button click
              String title = _titleController.text;
              String description = _descriptionController.text;
              String category = _selectedCategory;

              // You can now post this data to your backend or perform any desired action
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }
}
