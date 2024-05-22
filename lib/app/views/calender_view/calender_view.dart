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
  final addNextPeyment = AddNextPeyment();
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.040,
            vertical: heigth * 0.060,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Calendar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.078,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.005),
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
              SizedBox(height: heigth * 0.025),
              Text(
                'Next payment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.048,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: heigth * 0.020),
              SizedBox(
                height: heigth * 0.5,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: addNextPeyment.addNextPeymentSiteUrl.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: width * 0.0343,
                        height: heigth * 0.071,
                        padding: EdgeInsets.only(
                          left: width * 0.012,
                          top: heigth * 0.010,
                        ),
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
                              width: width * 0.09,
                              height: heigth * 0.036,
                              child: SvgPicture.asset(
                                'assets/icons/spotify_icon.svg',
                              ),
                            ),
                            SizedBox(width: width * 0.012),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  addNextPeyment.addNextPeymentSiteUrl[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.050,
                                  ),
                                ),
                                Text(
                                  'Last paid ${addNextPeyment.addNextPeymentCost[index]}\$ on ${addNextPeyment.addNextPeymentDate[index]}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.033,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: width * 0.08,
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
