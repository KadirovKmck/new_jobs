// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            const Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w600,
                height: 0.02,
                letterSpacing: -0.32,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ListTile(
              title: const Text(
                'Notifications',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: CupertinoSwitch(
                value: _notificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
              contentPadding: EdgeInsets.zero,
            ),
            const Divider(color: Colors.grey),
            _buildSettingsOption('Support', const Color(0xFF007AFF), () {}),
            _buildSettingsOption('Share app', const Color(0xFF007AFF), () {}),
            _buildSettingsOption('Rate us', const Color(0xFF007AFF), () {}),
            _buildSettingsOption('Delete account', Colors.red, () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(String title, Color color, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w400,
              ),
            )),
        const Divider(color: Colors.grey),
      ],
    );
  }
}
