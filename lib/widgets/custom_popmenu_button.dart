import 'package:borrowult/utils/theme_consts.dart';
import 'package:flutter/material.dart';

class PopMenuCustom extends StatefulWidget {
  final String choice1;
  final String choice2;

  PopMenuCustom({
    Key? key,
    required this.choice1,
    required this.choice2,
  }) : super(key: key);

  @override
  State<PopMenuCustom> createState() => _PopMenuCustomState();
}

class _PopMenuCustomState extends State<PopMenuCustom> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.choice1; // Initialize with the first choice
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: secondary2,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Add shadow color
            offset: Offset(0, 2), // Add vertical offset
            blurRadius: 4, // Add blur radius
          ),
        ],
      ),
      child: DropdownButton<String>(
        
        dropdownColor: secondary2,
        value: dropdownValue,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        elevation: 16,
        style: const TextStyle(color: Colors.white),
        underline: Container(
          height: 2,
          color: Colors.transparent,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: <String>[widget.choice1, widget.choice2]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
