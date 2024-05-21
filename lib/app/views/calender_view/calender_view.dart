import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_jobs/app/views/home_views/views/add_subscription_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    final addNextPeyment = AddNextPeyment();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Calendar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(16),
                  color: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: SfDateRangePicker(
                      onSelectionChanged:
                          (DateRangePickerSelectionChangedArgs args) {},
                      selectionMode: DateRangePickerSelectionMode.multiple,
                      headerStyle: const DateRangePickerHeaderStyle(
                        backgroundColor: Colors.transparent,
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.transparent,
                      selectionColor: Colors.blue,
                      selectionTextStyle: const TextStyle(color: Colors.white),
                      rangeSelectionColor: Colors.white,
                      view: DateRangePickerView.month,
                      monthCellStyle: const DateRangePickerMonthCellStyle(
                        textStyle: TextStyle(color: Colors.white),
                        specialDatesTextStyle: TextStyle(color: Colors.white),
                        blackoutDatesDecoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        blackoutDateTextStyle:
                            TextStyle(backgroundColor: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Next payment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 450,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: addNextPeyment.addNextPeymentSiteUrl.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: 343,
                        height: 71,
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
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  addNextPeyment.addNextPeymentSiteUrl[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'Last paid ${addNextPeyment.addNextPeymentCost[index]}\$ on ${addNextPeyment.addNextPeymentDate[index]}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              size: 35,
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
}
