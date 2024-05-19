import 'package:flutter/material.dart';
import 'package:new_jobs/app/views/welcom_views/track_subscription/widgets/track_sub_widgte/track_sub_view_three.dart';

class TrackSubViewOne extends StatelessWidget {
  const TrackSubViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const TrackSubWidget(
      welcomName: 'Track subscriptionn',
      welcomDescription:
          'Track and manage all your subscriptions\neasily from a single place',
      welcomImage: 'welcom',
    );
  }
}
