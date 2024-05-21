import 'package:flutter/material.dart';
import 'package:new_jobs/app/views/home_views/widgets/active_and_inactive_widget.dart';
import 'package:new_jobs/app/views/home_views/widgets/reminder_contener_widget.dart';
import 'package:new_jobs/app/views/home_views/widgets/subscription_app_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 25,
              // ),
              SubscriptionAppBarWidget(),
              SizedBox(
                height: 36,
              ),
              Text(
                'Reminder',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: ReminderContainerWidget(),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ActiveAndInactiveWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
