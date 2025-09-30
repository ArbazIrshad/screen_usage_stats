import 'package:useage_stats/models/app_usage_info.dart';

import 'useage_stats_platform_interface.dart';

class UseageStats {
  Future<String?> getPlatformVersion() {
    return UseageStatsPlatform.instance.getPlatformVersion();
  }

  Future<void> openAppUsagePermission() {
    return UseageStatsPlatform.instance.openAppUsagePermission();
  }

  Future<List<AppUsageInfo>> getUsageStatsForToday() {
    return UseageStatsPlatform.instance.getUsageStatsForToday();
  }

  Future<void> startMonitoring() {
    return UseageStatsPlatform.instance.startMonitoring();
  }

  Future<void> getAppUseage() {}
}
