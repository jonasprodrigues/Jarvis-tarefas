import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  static Future init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);

    await plugin.initialize(settings);
  }

  static Future show(String title, String body) async {
    const android = AndroidNotificationDetails(
      'jarvis',
      'Jarvis',
      importance: Importance.max,
      priority: Priority.high,
    );

    const details = NotificationDetails(android: android);

    await plugin.show(0, title, body, details);
  }
}