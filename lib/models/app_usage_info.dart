import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'app_usage_info.freezed.dart';
part 'app_usage_info.g.dart';

@freezed
abstract class AppUsageInfo with _$AppUsageInfo {
  const factory AppUsageInfo({
    required String applicationName,
    required String packageName,
    required int totalTimeInForeground,
    required int lastTimeUsed,
    required int firstTimeStamp,
    required int describeContents,
    required int totalTimeVisible,
    required int lastTimeVisible,
    required int totalTimeForegroundServiceUsed,
    required int lastTimeForegroundServiceUsed,
    required int lastTimeStamp,
  }) = _AppUsageInfo;

  factory AppUsageInfo.fromJson(Map<String, Object?> json) =>
      _$AppUsageInfoFromJson(json);
}

DateFormat _timeFormat = DateFormat('HH:mm:ss');
DateFormat _dateTimeFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');

extension AppUsageInfoListExtension on AppUsageInfo {
  String totalTimeInForegroundHumanReadable() {
    Duration duration = Duration(milliseconds: totalTimeInForeground);
    return _timeFormat.format(DateTime(0).add(duration));
  }

  String firstTimeStampHumanReadable() {
    return _dateTimeFormatter.format(
      DateTime.fromMillisecondsSinceEpoch(firstTimeStamp),
    );
  }

  String lastTimeUsedHumanReadable() {
    return _dateTimeFormatter.format(
      DateTime.fromMillisecondsSinceEpoch(lastTimeUsed),
    );
  }

  String lastTimeVisibleHumanReadable() {
    return _dateTimeFormatter.format(
      DateTime.fromMillisecondsSinceEpoch(lastTimeVisible),
    );
  }

  String lastTimeForegroundServiceUsedHumanReadable() {
    if (lastTimeForegroundServiceUsed == 0) {
      return "Never";
    }

    return _dateTimeFormatter.format(
      DateTime.fromMillisecondsSinceEpoch(lastTimeForegroundServiceUsed),
    );
  }

  String lastTimeStampHumanReadable() {
    return _dateTimeFormatter.format(
      DateTime.fromMillisecondsSinceEpoch(lastTimeStamp),
    );
  }

  String totalTimeVisibleHumanReadable() {
    Duration duration = Duration(milliseconds: totalTimeVisible);
    return _timeFormat.format(DateTime(0).add(duration));
  }

  String totalTimeForegroundServiceUsedHumanReadable() {
    Duration duration = Duration(milliseconds: totalTimeForegroundServiceUsed);
    return _timeFormat.format(DateTime(0).add(duration));
  }

  String describeContentsHumanReadable() {
    return describeContents.toString();
  }
}

// final result = {
//   'applicationName': 'System launcher',
//   'packageName': 'com.miui.home',
//   'totalTimeInForeground': 10447493,
//   'lastTimeUsed': 1758734251410,
//   'firstTimeStamp': 1758623687090,
//   'describeContents': 0,
//   'totalTimeVisible': 10743442,
//   'lastTimeVisible': 1758734251410,
//   'totalTimeForegroundServiceUsed': 0,
//   'lastTimeForegroundServiceUsed': 0,
//   'lastTimeStamp': 1758734251410,
// };
