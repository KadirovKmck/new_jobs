// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:new_jobs/app/components/conteiner_ui.dart';
import 'package:new_jobs/app/components/navbar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CratingInterfaceView extends StatefulWidget {
  const CratingInterfaceView({super.key});

  @override
  _CratingInterfaceViewState createState() => _CratingInterfaceViewState();
}

class _CratingInterfaceViewState extends State<CratingInterfaceView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: heigth * 0.100,
            ),
            Text(
              'Personafication',
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.060,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: heigth * 0.030,
            ),
            CircularPercentIndicator(
              linearGradient: const LinearGradient(colors: [
                Color(0xff4CA1FE),
                Color(0xff32338D),
              ], stops: [
                0,
                100,
              ]),

              percent: _progress,
              radius: 90,
              lineWidth: 20,
              circularStrokeCap: CircularStrokeCap.round,
              // progressColor: const Color(0xFF32338D),
              backgroundColor: const Color.fromARGB(163, 0, 123, 255),
            ),
            SizedBox(
              height: heigth * 0.030,
            ),
            SizedBox(
              width: width * 0.755,
              child: Text(
                'Please wait\nNow we will configure the app based on your answers',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.039,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: heigth * 0.020,
            ),
            FractionallySizedBox(
              widthFactor: 0.6,
              child: Text(
                _getProgressMessage(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xff007AFF),
                  fontSize: width * 0.035,
                ),
              ),
            ),
            SizedBox(height: heigth * 0.260),
            if (_progress == 1.0)
              ConteinerUi(
                name: 'Coutinue',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavbarView(),
                    ),
                  );
                },
              )
          ],
        ),
      ),
    );
  }

  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    Future.delayed(const Duration(seconds: 2), _updateProgress);
  }

  void _updateProgress() {
    if (_progress < 1.0) {
      setState(() {
        _progress += 0.25;
      });
      Future.delayed(const Duration(seconds: 2), _updateProgress);
    } else {
      setState(() {
        // Loading complete
      });
    }
  }

  String _getProgressMessage() {
    if (_progress <= 0.25) {
      return _messages[0];
    } else if (_progress <= 0.5) {
      return _messages[0];
    } else if (_progress <= 0.75) {
      return _messages[2];
    } else {
      return _messages[3];
    }
  }

  final List<String> _messages = [
    "Curating your ideal interface",
    "Molding the app to your taste",
    "Shaping every detail to fit",
    "Configuration complete",
  ];
}
