import 'package:flutter/material.dart';
import 'package:new_jobs/app/components/conteiner_ui.dart';
import 'package:new_jobs/app/views/home_views/views/textfild_widget/textfild_widget.dart';

class AddNotificationView extends StatefulWidget {
  const AddNotificationView({super.key});

  @override
  State<AddNotificationView> createState() => _AddNotificationViewState();
}

class _AddNotificationViewState extends State<AddNotificationView> {
  final nameSiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.050,
            vertical: heigth * 0.060,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.white,
                  size: width * 0.070,
                ),
              ),
              const Center(
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage('assets/images/kadirov.jpeg'),
                ),
              ),
              Center(
                child: Text(
                  'Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFC4C4C4),
                    fontSize: width * 0.064,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: heigth * 0.045,
              ),
              TextfildWidget(
                readOnly: false,
                controller: nameSiteController,
                placeholder: 'Site name',
              ),
              SizedBox(
                height: heigth * 0.46,
              ),
              SizedBox(
                width: double.infinity,
                child: ConteinerUi(
                  name: 'Send me notifications',
                  onTap: () {
                    Navigator.pop(context, nameSiteController.text);
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
