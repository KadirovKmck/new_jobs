import 'package:flutter/material.dart';

class CoteineerQuestion extends StatelessWidget {
  const CoteineerQuestion(
      {super.key, required this.title, this.onTap, required this.side});
  final String title;
  final Function()? onTap;
  final BorderSide side;
  @override
  Widget build(BuildContext context) {
    final heidth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: heidth * 0.4,
        height: width * 0.082,
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
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.038,
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
