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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.650, top: height * 0.030),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuestionView(),
                  ),
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: const Color(0xFFCBCBCB),
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          SizedBox(
            width: width * 1,
            height: height * 0.406,
            child: Image.asset('assets/images/$welcomImage.png'),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          Column(
            children: [
              Text(
                welcomName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.077,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                welcomDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.034,
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
