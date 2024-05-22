import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubscriptionAppBarWidget extends StatelessWidget {
  final VoidCallback onAddSubscription;

  const SubscriptionAppBarWidget({
    super.key,
    required this.onAddSubscription,
  });

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subscription',
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.078,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: heigth * 0.005),
            Row(
              children: [
                Text(
                  'Per month   48\$',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.038,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: width * 0.24,
        ),
        GestureDetector(
          onTap: onAddSubscription,
          child: SvgPicture.asset(
            'assets/icons/plus_icon.svg',
            height: heigth * 0.060,
            width: width * 0.060,
          ),
        ),
      ],
    );
  }
}
