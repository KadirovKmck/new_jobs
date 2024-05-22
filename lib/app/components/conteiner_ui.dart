import 'package:flutter/material.dart';

class ConteinerUi extends StatelessWidget {
  const ConteinerUi({super.key, required this.name, required this.onTap});
  final String name;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.843,
        height: height * 0.041,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(1.00, 0.00),
            end: Alignment(-1, 0),
            colors: [Color(0xFF4CA1FE), Color(0xFF32338D)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x7F04041A),
              blurRadius: 6,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w600,
              height: 0.05,
            ),
          ),
        ),
      ),
    );
  }
}
