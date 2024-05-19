import 'package:flutter/material.dart';
import 'package:new_jobs/app/views/welcom_views/welcom_view.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const WelcomView(),
    );
  }
}
