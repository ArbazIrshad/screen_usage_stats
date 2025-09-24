// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_usage_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUsageInfo _$AppUsageInfoFromJson(Map<String, dynamic> json) =>
    _AppUsageInfo(
      applicationName: json['applicationName'] as String,
      packageName: json['packageName'] as String,
      totalTimeInForeground: (json['totalTimeInForeground'] as num).toInt(),
      lastTimeUsed: (json['lastTimeUsed'] as num).toInt(),
      firstTimeStamp: (json['firstTimeStamp'] as num).toInt(),
      describeContents: (json['describeContents'] as num).toInt(),
      totalTimeVisible: (json['totalTimeVisible'] as num).toInt(),
      lastTimeVisible: (json['lastTimeVisible'] as num).toInt(),
      totalTimeForegroundServiceUsed:
          (json['totalTimeForegroundServiceUsed'] as num).toInt(),
      lastTimeForegroundServiceUsed:
          (json['lastTimeForegroundServiceUsed'] as num).toInt(),
      lastTimeStamp: (json['lastTimeStamp'] as num).toInt(),
    );

Map<String, dynamic> _$AppUsageInfoToJson(_AppUsageInfo instance) =>
    <String, dynamic>{
      'applicationName': instance.applicationName,
      'packageName': instance.packageName,
      'totalTimeInForeground': instance.totalTimeInForeground,
      'lastTimeUsed': instance.lastTimeUsed,
      'firstTimeStamp': instance.firstTimeStamp,
      'describeContents': instance.describeContents,
      'totalTimeVisible': instance.totalTimeVisible,
      'lastTimeVisible': instance.lastTimeVisible,
      'totalTimeForegroundServiceUsed': instance.totalTimeForegroundServiceUsed,
      'lastTimeForegroundServiceUsed': instance.lastTimeForegroundServiceUsed,
      'lastTimeStamp': instance.lastTimeStamp,
    };
