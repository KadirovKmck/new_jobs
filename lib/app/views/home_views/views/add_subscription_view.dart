import 'package:flutter/material.dart';
import 'package:new_jobs/app/components/conteiner_ui.dart';
import 'package:new_jobs/app/views/home_views/views/textfild_widget/textfild_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class AddSubscriptionView extends StatefulWidget {
  final Function() onSubscriptionAdded;

  const AddSubscriptionView({super.key, required this.onSubscriptionAdded});

  @override
  State<AddSubscriptionView> createState() => _AddSubscriptionViewState();
}

class _AddSubscriptionViewState extends State<AddSubscriptionView> {
  final costController = TextEditingController();
  final siteUrlController = TextEditingController();
  final noteController = TextEditingController();
  final subscriptionController = TextEditingController();
  final expirationController = TextEditingController();
  final List<DateTime> selectedDates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const Center(
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage('assets/images/kadirov.jpeg'),
                ),
              ),
              const Center(
                child: Text(
                  'Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFC4C4C4),
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              TextfildWidget(
                readOnly: false,
                controller: costController,
                placeholder: 'Cost',
              ),
              const SizedBox(
                height: 40,
              ),
              TextfildWidget(
                readOnly: false,
                controller: siteUrlController,
                placeholder: 'Site Url',
              ),
              const SizedBox(
                height: 40,
              ),
              TextfildWidget(
                readOnly: false,
                controller: noteController,
                placeholder: 'Note',
              ),
              const SizedBox(
                height: 40,
              ),
              TextfildWidget(
                onTap: () async {
                  showSfDate(context, subscriptionController, selectedDates);
                },
                readOnly: true,
                controller: subscriptionController,
                placeholder: 'Subscription Date',
              ),
              const SizedBox(
                height: 40,
              ),
              TextfildWidget(
                onTap: () async {
                  showSfDate(context, expirationController, selectedDates);
                },
                readOnly: true,
                controller: expirationController,
                placeholder: 'Expiration Date',
              ),
              const SizedBox(
                height: 53,
              ),
              SizedBox(
                width: double.infinity,
                child: ConteinerUi(
                  name: 'Send me notifications',
                  onTap: () {
                    final addNextPeyment = AddNextPeyment();
                    addNextPeyment.addNextPeymentCost.add(costController.text);
                    addNextPeyment.addNextPeymentDate
                        .add(subscriptionController.text);
                    addNextPeyment.addNextPeymentSiteUrl
                        .add(siteUrlController.text);
                    addNextPeyment.addNextPeymentDateCalender
                        .addAll(selectedDates);

                    costController.clear();
                    expirationController.clear();
                    noteController.clear();
                    siteUrlController.clear();
                    subscriptionController.clear();

                    widget.onSubscriptionAdded();

                    setState(() {
                      selectedDates.clear();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showSfDate(BuildContext context,
      TextEditingController controller, List<DateTime> selectedDates) {
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
                  final selected = args.value;
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  setState(() {
                    controller.text = selected
                        .map((date) => formatter.format(date))
                        .join(', ');
                    selectedDates
                      ..clear()
                      ..addAll(selected);
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

class AddNextPeyment {
  AddNextPeyment._privateConstructor();
  static final AddNextPeyment _instance = AddNextPeyment._privateConstructor();
  factory AddNextPeyment() {
    return _instance;
  }

  final List<String> addNextPeymentCost = [];
  final List<String> addNextPeymentDate = [];
  final List<String> addNextPeymentSiteUrl = [];
  final List<DateTime> addNextPeymentDateCalender = [];
}
