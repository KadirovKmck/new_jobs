import 'package:flutter/material.dart';
import 'package:new_jobs/app/views/welcom_views/track_subscription/widgets/track_sub_widgte/track_sub_view_three.dart';

class TrackSubViewTwo extends StatelessWidget {
  const TrackSubViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const TrackSubWidget(
      welcomName: 'Reminders',
      welcomDescription:
          'Schedule notifications for your subscriptions renewal at any given time',
      welcomImage: 'welcom2',
    );
  }
}
