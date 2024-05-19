import 'package:flutter/material.dart';

class ConteinerUi extends StatelessWidget {
  const ConteinerUi({super.key, required this.name, required this.onTap});
  final String name;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 343,
        height: 41,
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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 0.05,
              letterSpacing: -0.32,
            ),
          ),
        ),
      ),
    );
  }
}
