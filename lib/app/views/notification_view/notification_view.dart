import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:new_jobs/app/views/notification_view/views/add_notification_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final List<bool> notificationsEnabled = [];
  final List<String> selectedDatesText = [];
  final List<String> addNotificationSiteUrl = [];

  Future<void> navigateToAddNote() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNotificationView(),
      ),
    );

    if (result != null) {
      setState(() {
        addNotificationSiteUrl.add(result as String);
        notificationsEnabled.add(false);
        selectedDatesText.add(''); // Add a corresponding empty string
      });
    }
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notification',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.078,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateToAddNote();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/plus_icon.svg',
                    ),
                  ),
                ],
              ),
              SizedBox(height: heigth * 0.040),
              addNotificationSiteUrl.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: SvgPicture.asset('assets/icons/strelca.svg'),
                          ),
                          Center(
                              child: SvgPicture.asset('assets/icons/text.svg'))
                        ],
                      ),
                    )
                  : SizedBox(
                      height: heigth * 1,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: addNotificationSiteUrl.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              width: double.infinity,
                              height: heigth * 0.09,
                              padding: const EdgeInsets.only(left: 12, top: 10),
                              decoration: ShapeDecoration(
                                color: const Color(0xFF3B3B3B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.1,
                                        height: heigth * 0.036,
                                        child: SvgPicture.asset(
                                          'assets/icons/spotify_icon.svg',
                                        ),
                                      ),
                                      SizedBox(width: width * 0.012),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            addNotificationSiteUrl[index],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width * 0.050,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.calendar_month_outlined,
                                                color: Color(0xff4C9FFC),
                                              ),
                                              SizedBox(
                                                width: width * 0.01,
                                              ),
                                              Text(
                                                notificationsEnabled[index]
                                                    ? selectedDatesText[index]
                                                    : 'Set reminder',
                                                style: TextStyle(
                                                  fontSize: width * 0.036,
                                                  color:
                                                      const Color(0xff4C9FFC),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      CupertinoSwitch(
                                        activeColor: Colors.blue,
                                        value: notificationsEnabled[index],
                                        onChanged: (bool value) {
                                          setState(() {
                                            notificationsEnabled[index] = value;
                                            if (value) {
                                              showSfDate(context, index);
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showSfDate(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: 300,
            height: 400,
            child: SfDateRangePicker(
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is List<DateTime>) {
                  final selectedDates = args.value as List<DateTime>;
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  final formattedDates = selectedDates
                      .map((date) => formatter.format(date))
                      .join(', ');
                  setState(() {
                    selectedDatesText[index] = ' $formattedDates';
                  });
                  Navigator.of(context).pop();
                }
              },
              selectionMode: DateRangePickerSelectionMode.multiple,
            ),
          ),
        );
      },
    );
  }
}
