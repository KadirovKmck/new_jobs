import 'package:flutter/material.dart';

class CoteineerQuestion extends StatelessWidget {
  const CoteineerQuestion(
      {super.key, required this.title, this.onTap, required this.side});
  final String title;
  final Function()? onTap;
  final BorderSide side;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 343,
        height: 41,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: const Color(0x7F4B9CF9),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), side: side),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              height: 0.05,
            ),
          ),
        ),
      ),
    );
  }
}
