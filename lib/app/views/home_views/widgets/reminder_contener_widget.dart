import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ReminderContainerWidget extends StatelessWidget {
  const ReminderContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final title = <String>[
      'Spotify',
      'Apple Music',
      'Spotify',
    ];

    final assetsIcons = <String>[
      'spotify_icon',
      'apple_music',
      'spotify_icon',
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          3,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: screenWidth * 0.4,
              height: screenWidth * 0.3,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: ShapeDecoration(
                color: const Color(0xCC4CA1FE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/${assetsIcons[index]}.svg',
                        height: screenWidth * 0.1,
                        width: screenWidth * 0.1,
                      ),
                      SizedBox(width: screenWidth * 0.015),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.033,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            '6\$',
                            style: TextStyle(
                              color: Color(0xFF4A4A4A),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenheight * 0.0048),
                  Row(
                    children: [
                      CircularPercentIndicator(
                        radius: screenWidth * 0.045,
                        lineWidth: 5,
                        circularStrokeCap: CircularStrokeCap.round,
                        percent: 0.8,
                        center: const Text(
                          '5',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        progressColor: const Color(0xFF33358F),
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(width: 9),
                      const Flexible(
                        child: Text(
                          'Days\nremaining',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
