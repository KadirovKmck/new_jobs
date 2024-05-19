import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_jobs/app/views/home_views/views/add_subscription_view.dart';

class SubscriptionAppBarWidget extends StatelessWidget {
  const SubscriptionAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subscription',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Per month',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '48\$',
                  style: TextStyle(
                    color: Color(0xFFD3D3D3),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          width: 96,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddSubscriptionView(),
                ));
          },
          child: SvgPicture.asset(
            'assets/icons/plus_icon.svg',
            height: 60,
            width: 60,
          ),
        ),
      ],
    );
  }
}
