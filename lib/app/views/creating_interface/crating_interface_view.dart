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
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Personafication',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
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
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                width: 255,
                child: Text(
                  'Please wait\nNow we will configure the app based on your answers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FractionallySizedBox(
                widthFactor: 0.6,
                child: Text(
                  _getProgressMessage(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff007AFF),
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 260),
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
    Future.delayed(const Duration(seconds: 1), _updateProgress);
  }

  void _updateProgress() {
    if (_progress < 1.0) {
      setState(() {
        _progress += 0.20;
      });
      Future.delayed(const Duration(seconds: 1), _updateProgress);
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
      return _messages[1];
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
