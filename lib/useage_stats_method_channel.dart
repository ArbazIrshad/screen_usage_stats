import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:useage_stats/models/app_usage_info.dart';

import 'useage_stats_platform_interface.dart';

/// An implementation of [UseageStatsPlatform] that uses method channels.
class MethodChannelUseageStats extends UseageStatsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('useage_stats');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  @override
  Future<void> openAppUsagePermission() async {
    final version = await methodChannel.invokeMethod<void>(
      'openAppusageSettings',
    );
  }

  @override
  Future<List<AppUsageInfo>> getUsageStatsForToday() async {
    final Map result = await methodChannel.invokeMethod(
      'getUpdatedUsageStatsToday',
    );
    print('Result from native: $result');

    List<AppUsageInfo> apps = result.entries.map((entry) {
      final value = entry.value as Map;
      return AppUsageInfo.fromJson(Map<String, dynamic>.from(value));
    }).toList();

    return apps;
  }

  @override
  Future<void> startMonitoring() async {
    final res = await methodChannel.invokeMethod<String>('startMonitoring');
    print('Start Monitoring Result: $res');
    return;
  }
}

// final result = {
//   'applicationName': 'Security',
//   'packageName': 'com.miui.securitycenter',
//   'totalTimeInForeground': 77049,
//   'lastTimeUsed': 1758732639907,
//   'firstTimeStamp': 1758710101226,
//   'describeContents': 0,
//   'totalTimeVisible': 80438,
//   'lastTimeVisible': 1758732640039,
//   'totalTimeForegroundServiceUsed': 0,
//   'lastTimeForegroundServiceUsed': 0,
//   'lastTimeStamp': 1758732640039,
// };
