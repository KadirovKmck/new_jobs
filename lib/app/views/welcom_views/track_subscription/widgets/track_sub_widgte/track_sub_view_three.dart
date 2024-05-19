import 'package:flutter/material.dart';
import 'package:new_jobs/app/views/question_view/question_view.dart';

class TrackSubWidget extends StatelessWidget {
  const TrackSubWidget({
    super.key,
    required this.welcomName,
    required this.welcomDescription,
    required this.welcomImage,
  });
  final String welcomName;
  final String welcomDescription;
  final String welcomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 330, top: 10),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuestionView(),
                  ),
                );
              },
              child: const Text(
                'Skip',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFCBCBCB),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 0.11,
                  letterSpacing: -0.32,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: 406,
            height: 406,
            child: Image.asset('assets/images/$welcomImage.png'),
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            children: [
              Text(
                welcomName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                welcomDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
