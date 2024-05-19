import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextfildWidget extends StatefulWidget {
  const TextfildWidget({
    super.key,
    required this.controller,
    required this.placeholder,
    this.onChanged,
    this.onTap,
    required this.readOnly,
  });
  final TextEditingController controller;
  final String placeholder;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool readOnly;
  @override
  State<TextfildWidget> createState() => _TextfildWidgetState();
}

class _TextfildWidgetState extends State<TextfildWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      placeholder: widget.placeholder,
      placeholderStyle: const TextStyle(
        color: Color(0xff677294),
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
