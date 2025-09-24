import 'package:flutter_test/flutter_test.dart';
import 'package:useage_stats/useage_stats.dart';
import 'package:useage_stats/useage_stats_platform_interface.dart';
import 'package:useage_stats/useage_stats_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUseageStatsPlatform
    with MockPlatformInterfaceMixin
    implements UseageStatsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final UseageStatsPlatform initialPlatform = UseageStatsPlatform.instance;

  test('$MethodChannelUseageStats is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUseageStats>());
  });

  test('getPlatformVersion', () async {
    UseageStats useageStatsPlugin = UseageStats();
    MockUseageStatsPlatform fakePlatform = MockUseageStatsPlatform();
    UseageStatsPlatform.instance = fakePlatform;

    expect(await useageStatsPlugin.getPlatformVersion(), '42');
  });
}
