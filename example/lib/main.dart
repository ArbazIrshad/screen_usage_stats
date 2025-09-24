import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:useage_stats/models/app_usage_info.dart';
import 'package:useage_stats/useage_stats.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _useageStatsPlugin = UseageStats();

  List<AppUsageInfo> apps = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // String platformVersion;
    // // Platform messages may fail, so we use a try/catch PlatformException.
    // // We also handle the message potentially returning null.
    // try {
    //   platformVersion =
    //       await _useageStatsPlugin.getPlatformVersion() ??
    //       'Unknown platform version';
    // } on PlatformException {
    //   platformVersion = 'Failed to get platform version.';
    // }

    // // If the widget was removed from the tree while the asynchronous platform
    // // message was in flight, we want to discard the reply rather than calling
    // // setState to update our non-existent appearance.
    // if (!mounted) return;

    // setState(() {
    //   _platformVersion = platformVersion;
    // });

    try {
      apps = await _useageStatsPlugin.getUsageStatsForToday();
      if (!mounted) return;
      setState(() {});
    } on PlatformException catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Column(
          children: [
            // Center(child: Text('Running on: $_platformVersion\n')),
            ElevatedButton(
              onPressed: () {
                _useageStatsPlugin.openAppUsagePermission();
              },
              child: const Text('Open App Usage Permission'),
            ),
            Expanded(
              child: ListView(
                children: [for (final app in apps) AppInfoWidget(app: app)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppInfoWidget extends StatelessWidget {
  const AppInfoWidget({super.key, required this.app});

  final AppUsageInfo app;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(app.applicationName),
        Text(
          'Package: ${app.packageName}\n'
          'Total Time in Foreground: ${app.totalTimeInForegroundHumanReadable()}\n'
          'Last Time Used: ${app.lastTimeUsedHumanReadable()}\n'
          'First Time Stamp: ${app.firstTimeStampHumanReadable()}\n'
          'Total Time Visible: ${app.totalTimeVisibleHumanReadable()}\n'
          'Last Time Visible: ${app.lastTimeVisibleHumanReadable()}\n'
          'Total Time Foreground Service Used: ${app.totalTimeForegroundServiceUsedHumanReadable()}\n'
          'Last Time Foreground Service Used: ${app.lastTimeForegroundServiceUsedHumanReadable()}\n'
          'Last Time Stamp: ${app.lastTimeStampHumanReadable()}\n'
          'Describe Contents: ${app.describeContentsHumanReadable()}\n',
        ),
        // Text(''),
        Text('---'),
      ],
    );
  }
}
