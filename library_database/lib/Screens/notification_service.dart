import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    tz.initializeTimeZones();
    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
  Future<void> scheduleNotification({
    required String title,
    required String body,
  }) async {
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'due_book_channel_id',
      'Due Book Channel',
      channelDescription: 'Channel for due book notifications',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    final NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
    // Set scheduledDateTime to be current time plus one minute
    tz.TZDateTime scheduledDateTime =
    tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10));
    print(scheduledDateTime);
    print(tz.TZDateTime.now(tz.local));
    print("Executed13");
    try {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        title,
        body,
        scheduledDateTime,
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
      );
    } catch (e) {
      print('Error scheduling notification: $e');
    }
  }

  Future<void> showTestNotification() async {
    await scheduleNotification(
      title: 'Test Notification',
      body: 'This is a test notification for testing purposes.',
    );
  }

}