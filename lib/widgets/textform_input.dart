import 'package:flutter/material.dart';
import '../utils/theme_consts.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget({
    Key? key,
    required this.textHint,
    required this.maxLines,
    required this.controller,
  }) : super(key: key);

  final String textHint;
  final int? maxLines;
  final TextEditingController controller;

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      controller: _controller,
      style: TextStyle(color: Colors.white), // Text color
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        fillColor: primary,
        filled: true,
        border: InputBorder.none,
        hintText: widget.textHint,
        hintStyle: TextStyle(
          fontSize: 12.06,
          color: Color.fromARGB(138, 255, 255, 255),
        ),
      ),
    );
  }
}
