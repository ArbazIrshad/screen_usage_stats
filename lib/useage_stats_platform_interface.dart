import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:useage_stats/models/app_usage_info.dart';

import 'useage_stats_method_channel.dart';

abstract class UseageStatsPlatform extends PlatformInterface {
  /// Constructs a UseageStatsPlatform.
  UseageStatsPlatform() : super(token: _token);

  static final Object _token = Object();

  static UseageStatsPlatform _instance = MethodChannelUseageStats();

  /// The default instance of [UseageStatsPlatform] to use.
  ///
  /// Defaults to [MethodChannelUseageStats].
  static UseageStatsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UseageStatsPlatform] when
  /// they register themselves.
  static set instance(UseageStatsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> openAppUsagePermission() async {
    throw UnimplementedError(
      'openAppUsagePermission() has not been implemented.',
    );
  }

  Future<List<AppUsageInfo>> getUsageStatsForToday() async {
    throw UnimplementedError(
      'getUseageStatsForToday() has not been implemented.',
    );
  }

  Future<bool?> hasPermission() async {
    throw UnimplementedError('hasPermission() has not been implemented.');
  }
}
