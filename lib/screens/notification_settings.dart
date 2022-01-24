import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({Key? key}) : super(key: key);
  static const String routeName = "NotificationSettings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            //TODO:Go back
          },
        ),
        title: Text(
          'Notification Settings',
          style: GoogleFonts.poppins(fontSize: 16.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          NotificationSettingTile(
            title: 'My Account',
            subtitle: 'You will recieve daily updates',
            isActive: true,
          ),
          NotificationSettingTile(
            title: 'Promotional Notifications',
            subtitle: 'You will recieve daily updates',
            isActive: false,
          ),
        ],
      ),
    );
  }
}

class NotificationSettingTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isActive;
  const NotificationSettingTile({
    Key? key,
    required this.isActive,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  State<NotificationSettingTile> createState() =>
      _NotificationSettingTileState();
}

class _NotificationSettingTileState extends State<NotificationSettingTile> {
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _isActive = widget.isActive;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.notifications,
            color: primaryColor,
            size: 45.0,
          ),
          trailing: CupertinoSwitch(
            activeColor: primaryColor,
            onChanged: (value) {
              setState(() {
                _isActive = value;
              });
            },
            value: _isActive,
          ),
          title: Text(
            widget.title,
            style: GoogleFonts.poppins(
              fontSize: 14.0,
            ),
          ),
          subtitle: Text(
            widget.subtitle,
            style: GoogleFonts.poppins(
              fontSize: 12.0,
              color: const Color(0xFF7B7B7B),
            ),
          ),
        ),
        const Divider(
          color: Color(0xFFD1D1D1),
          height: 1.0,
        ),
      ],
    );
  }
}
