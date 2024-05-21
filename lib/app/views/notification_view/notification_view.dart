import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final List<String> name = ['Twitter', 'Youtube'];
  final List<bool> notificationsEnabled = [false, false];
  final List<String> selectedDatesText = ['', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Notification',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/plus_icon.svg',
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 20),
            SizedBox(
              height: 450,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: name.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: 343,
                      height: 80,
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
                                width: 52.19,
                                height: 36.70,
                                child: SvgPicture.asset(
                                  'assets/icons/spotify_icon.svg',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month_outlined,
                                        color: Color(0xff4C9FFC),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        notificationsEnabled[index]
                                            ? selectedDatesText[index]
                                            : 'Set reminder',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff4C9FFC),
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
                          const SizedBox(height: 10),
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
