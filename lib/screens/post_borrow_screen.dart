import 'package:borrowult/utils/theme_consts.dart';
import 'package:borrowult/widgets/textform_input.dart';
import 'package:flutter/material.dart';

class SellTabContent extends StatefulWidget {
  const SellTabContent({super.key});

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
      height: double.maxFinite,
      padding: EdgeInsets.all(20),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormWidget(
                textHint: "Item Title(Keep it short)......",
                maxLines: 1,
                controller: _titleController),

            TextFormWidget(
                textHint: "Item Description.......",
                maxLines: 4,
                controller: _descriptionController),
            Expanded(
              child: Row(
                children: [
                  Text("Post the item For:"),
                  Container(
                    height: 26,
                    width: 97,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                          focusColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          fillColor: Colors.white),
                      elevation: 20,
                      value: _selectedCategory,
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                      items: ['For Sale', 'For Rent', 'For Exchange', 'Other']
                          .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),

            // Add your image upload widget here

            ElevatedButton(
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
      ),
    );
  }
}
