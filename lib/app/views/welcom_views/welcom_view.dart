import 'package:flutter/material.dart';
import 'package:new_jobs/app/components/conteiner_ui.dart';
import 'package:new_jobs/app/views/question_view/question_view.dart';
import 'package:new_jobs/app/views/welcom_views/track_subscription/track_sub_view_one.dart';
import 'package:new_jobs/app/views/welcom_views/track_subscription/track_sub_view_three.dart';
import 'package:new_jobs/app/views/welcom_views/track_subscription/track_sub_view_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomView extends StatelessWidget {
  const WelcomView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 700,
                child: PageView(
                  controller: controller,
                  children: const [
                    TrackSubViewOne(),
                    TrackSubViewTwo(),
                    TrackSubViewThree(),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const JumpingDotEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Color(0xff4C9FFC),
                  dotColor: Color.fromARGB(160, 76, 158, 252),
                  verticalOffset: 25,
                ),
              ),
              const SizedBox(
                height: 31,
              ),
              ConteinerUi(
                onTap: () {
                  int nextPage = controller.page!.toInt() + 1;
                  if (nextPage < 3) {
                    controller.animateToPage(
                      nextPage,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuestionView(),
                      ),
                    );
                  }
                },
                name: 'Get started',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
