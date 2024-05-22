import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key, Key});

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _notificationsEnabled = true;
  double _rating = 0.0;

  void _openSupportPage() async {
    const url = 'https://example.com/support';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showRatingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Rate Us'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              RatingBar.builder(
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text(
              'Are you sure you want to delete your account? This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop();
                _deleteAccount();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteAccount() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Account deleted successfully'),
      ),
    );
  }

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
            _buildSettingsOption(
                'Support', const Color(0xFF007AFF), _openSupportPage),
            _buildSettingsOption('Share app', const Color(0xFF007AFF), () {
              Share.share('Check out this amazing app!');
            }),
            _buildSettingsOption(
                'Rate us', const Color(0xFF007AFF), _showRatingDialog),
            _buildSettingsOption(
                'Delete account', Colors.red, _showDeleteAccountDialog),
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
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 20,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }
}
