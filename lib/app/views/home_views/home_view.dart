import 'package:flutter/material.dart';
import 'package:new_jobs/app/views/home_views/views/add_subscription_view.dart';
import 'package:new_jobs/app/views/home_views/widgets/active_and_inactive_widget.dart';
import 'package:new_jobs/app/views/home_views/widgets/reminder_contener_widget.dart';
import 'package:new_jobs/app/views/home_views/widgets/subscription_app_bar_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    AddNextPeyment();
    super.initState();
  }

  final addNextPeyment = AddNextPeyment();

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.040, vertical: heigth * 0.060),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubscriptionAppBarWidget(
                onAddSubscription: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddSubscriptionView(
                        onSubscriptionAdded: () {
                          setState(() {});
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: heigth * 0.036,
              ),
              const Text(
                'Reminder',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: heigth * 0.015,
              ),
              SizedBox(
                height: heigth * 0.120,
                width: double.infinity,
                child: const ReminderContainerWidget(),
              ),
              SizedBox(
                height: heigth * 0.030,
              ),
              Center(
                child: ActiveAndInactiveWidget(
                  addNextPeyment: addNextPeyment,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
