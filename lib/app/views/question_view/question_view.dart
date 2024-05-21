import 'package:flutter/material.dart';
import 'package:new_jobs/app/components/conteiner_ui.dart';
import 'package:new_jobs/app/components/coteineer_question.dart';
import 'package:new_jobs/app/constants/questions_answers.dart';
import 'package:new_jobs/app/constants/questions_text.dart';
import 'package:new_jobs/app/views/creating_interface/crating_interface_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({super.key});

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  final PageController _controller = PageController();
  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _controller.dispose();
    _selectedIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildPageIndicator(),
            const SizedBox(height: 40),
            _buildPageView(),
            const SizedBox(height: 225),
            _buildContinueButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Center(
      child: SmoothPageIndicator(
        controller: _controller,
        count: QuestionsText().questionsList.length,
        effect: const JumpingDotEffect(
          dotHeight: 10,
          dotWidth: 10,
          activeDotColor: Color(0xff4C9FFC),
          dotColor: Color.fromARGB(160, 76, 158, 252),
          verticalOffset: 25,
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return SizedBox(
      height: 470,
      child: PageView.builder(
        controller: _controller,
        itemCount: QuestionsText().questionsList.length,
        itemBuilder: (context, pageIndex) {
          return _buildQuestionPage(pageIndex);
        },
      ),
    );
  }

  Widget _buildQuestionPage(int pageIndex) {
    final questionsText = QuestionsText().questionsList;
    final answers = [
      QuestionsAnswers().fistColum,
      QuestionsAnswers().secondColum,
      QuestionsAnswers().threedColum,
      QuestionsAnswers().fourColum
    ];

    return Column(
      children: [
        SizedBox(
          height: 155,
          child: Text(
            questionsText[pageIndex],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 55),
        Expanded(
          child: ValueListenableBuilder<int>(
            valueListenable: _selectedIndexNotifier,
            builder: (context, selectedIndex, child) {
              return Column(
                children: List.generate(answers.length, (answerIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CoteineerQuestion(
                      title: answers[answerIndex][pageIndex],
                      onTap: () {
                        _selectedIndexNotifier.value = answerIndex;
                      },
                      side: BorderSide(
                        color: selectedIndex == answerIndex
                            ? const Color(0xFFCACCFF)
                            : Colors.transparent,
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return ConteinerUi(
      name: 'Continue',
      onTap: () {
        final nextPage = _controller.page!.toInt() + 1;
        if (nextPage < QuestionsText().questionsList.length) {
          _controller.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CratingInterfaceView(),
            ),
          );
        }
      },
    );
  }
}
