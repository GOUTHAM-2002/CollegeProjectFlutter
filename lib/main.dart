import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:college/login.dart';
import 'package:college/notifications.dart';
import 'package:flutter/material.dart';

void main() async {
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: "basic",
        channelName: "Basic",
        channelDescription: "Basic",
        channelGroupKey: "basic",
        ledColor: Colors.orange)
  ], channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: "basic", channelGroupName: "basicgroup")
  ]);
  bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowed) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: Notifications.onActionReceivedMethod,
        onDismissActionReceivedMethod: Notifications.onActionReceivedMethod,
        onNotificationCreatedMethod: Notifications.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            Notifications.onNotificationDisplayedMethod);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 27, 12, 3)),
        useMaterial3: true,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AwesomeNotifications().createNotification(
                content: NotificationContent(
                    id: 1,
                    channelKey: "basic",
                    title: "Upcoming Event",
                    body: "Yaay"));
          },
          child: const Icon(Icons.notification_add),
        ),
        body: const LoginPage(),
      ),
    );
  }
}
