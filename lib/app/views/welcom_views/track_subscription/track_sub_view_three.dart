import 'package:flutter/material.dart';
import 'package:new_jobs/app/views/welcom_views/track_subscription/widgets/track_sub_widgte/track_sub_view_three.dart';

class TrackSubViewThree extends StatelessWidget {
  const TrackSubViewThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const TrackSubWidget(
      welcomName: 'Statistics',
      welcomDescription:
          'Always care of your spending with the right data and insightful charts',
      welcomImage: 'welcom3',
    );
  }
}
