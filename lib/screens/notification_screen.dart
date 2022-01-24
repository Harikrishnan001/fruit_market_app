import 'package:flutter/material.dart';
import 'package:fruit_market_app/data/notifications.dart';
import 'package:fruit_market_app/models/fruit_notification.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import 'widgets/fruit_notification_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static const String routeName = "NotificationScreen";
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<FruitNotification> _arrivedToday = [];
  final List<FruitNotification> _arrivedYesterday = [];
  final List<FruitNotification> _arrivedThisWeek = [];
  final List<FruitNotification> _otherNotifications = [];
  final List<FruitNotification> _notifications = [];
  @override
  void initState() {
    super.initState();
    _updateNotifications();
  }

  void _updateNotifications() {
    for (final notification in notifications) {
      if (notification.arrivedToday()) {
        _arrivedToday.add(notification);
      } else if (notification.arrivedYesterday()) {
        _arrivedYesterday.add(notification);
      } else if (notification.arrivedThisWeek()) {
        _arrivedThisWeek.add(notification);
      } else {
        _otherNotifications.add(notification);
      }
    }
    _notifications.add(FruitNotification(
        imageURL: '', message: 'today', description: '', time: DateTime.now()));
    for (final value in _arrivedToday) {
      _notifications.add(value);
    }
    _notifications.add(FruitNotification(
        imageURL: '',
        message: 'yesterday',
        description: '',
        time: DateTime.now()));
    for (final value in _arrivedYesterday) {
      _notifications.add(value);
    }
    _notifications.add(FruitNotification(
        imageURL: '',
        message: 'thisWeek',
        description: '',
        time: DateTime.now()));
    for (final value in _arrivedThisWeek) {
      _notifications.add(value);
    }
    _notifications.add(FruitNotification(
        imageURL: '',
        message: 'others',
        description: '',
        time: DateTime.now()));
    for (final value in _otherNotifications) {
      _notifications.add(value);
    }
  }

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
          'Notifications',
          style: GoogleFonts.poppins(fontSize: 16.0),
        ),
      ),
      body: ListView.separated(
        itemCount: _notifications.length,
        separatorBuilder: (context, index) {
          if (_notifications[index].imageURL.isNotEmpty) {
            return const Divider(
              height: 1.0,
              thickness: 1,
            );
          }
          return const SizedBox();
        },
        itemBuilder: (context, index) {
          final item = _notifications[index];
          if (item.message == "today") {
            if (_arrivedToday.isNotEmpty) {
              return const DateText(text: "Today");
            } else {
              return const SizedBox();
            }
          } else if (item.message == 'yesterday') {
            if (_arrivedYesterday.isNotEmpty) {
              return const DateText(text: 'Yesterday');
            } else {
              return const SizedBox();
            }
          } else if (item.message == 'thisWeek') {
            if (_arrivedThisWeek.isNotEmpty) {
              return const DateText(text: 'This Week');
            } else {
              return const SizedBox();
            }
          } else if (item.message == 'others') {
            if (_otherNotifications.isNotEmpty) {
              return const DateText(text: 'Long ago');
            } else {
              return const SizedBox();
            }
          }
          return FruitNotificationWidget(item: item);
        },
      ),
    );
  }
}

class DateText extends StatelessWidget {
  final String text;
  const DateText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 30.0),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
