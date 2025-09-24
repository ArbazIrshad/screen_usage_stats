// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_usage_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppUsageInfo {

 String get applicationName; String get packageName; int get totalTimeInForeground; int get lastTimeUsed; int get firstTimeStamp; int get describeContents; int get totalTimeVisible; int get lastTimeVisible; int get totalTimeForegroundServiceUsed; int get lastTimeForegroundServiceUsed; int get lastTimeStamp;
/// Create a copy of AppUsageInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUsageInfoCopyWith<AppUsageInfo> get copyWith => _$AppUsageInfoCopyWithImpl<AppUsageInfo>(this as AppUsageInfo, _$identity);

  /// Serializes this AppUsageInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUsageInfo&&(identical(other.applicationName, applicationName) || other.applicationName == applicationName)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.totalTimeInForeground, totalTimeInForeground) || other.totalTimeInForeground == totalTimeInForeground)&&(identical(other.lastTimeUsed, lastTimeUsed) || other.lastTimeUsed == lastTimeUsed)&&(identical(other.firstTimeStamp, firstTimeStamp) || other.firstTimeStamp == firstTimeStamp)&&(identical(other.describeContents, describeContents) || other.describeContents == describeContents)&&(identical(other.totalTimeVisible, totalTimeVisible) || other.totalTimeVisible == totalTimeVisible)&&(identical(other.lastTimeVisible, lastTimeVisible) || other.lastTimeVisible == lastTimeVisible)&&(identical(other.totalTimeForegroundServiceUsed, totalTimeForegroundServiceUsed) || other.totalTimeForegroundServiceUsed == totalTimeForegroundServiceUsed)&&(identical(other.lastTimeForegroundServiceUsed, lastTimeForegroundServiceUsed) || other.lastTimeForegroundServiceUsed == lastTimeForegroundServiceUsed)&&(identical(other.lastTimeStamp, lastTimeStamp) || other.lastTimeStamp == lastTimeStamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationName,packageName,totalTimeInForeground,lastTimeUsed,firstTimeStamp,describeContents,totalTimeVisible,lastTimeVisible,totalTimeForegroundServiceUsed,lastTimeForegroundServiceUsed,lastTimeStamp);

@override
String toString() {
  return 'AppUsageInfo(applicationName: $applicationName, packageName: $packageName, totalTimeInForeground: $totalTimeInForeground, lastTimeUsed: $lastTimeUsed, firstTimeStamp: $firstTimeStamp, describeContents: $describeContents, totalTimeVisible: $totalTimeVisible, lastTimeVisible: $lastTimeVisible, totalTimeForegroundServiceUsed: $totalTimeForegroundServiceUsed, lastTimeForegroundServiceUsed: $lastTimeForegroundServiceUsed, lastTimeStamp: $lastTimeStamp)';
}


}

/// @nodoc
abstract mixin class $AppUsageInfoCopyWith<$Res>  {
  factory $AppUsageInfoCopyWith(AppUsageInfo value, $Res Function(AppUsageInfo) _then) = _$AppUsageInfoCopyWithImpl;
@useResult
$Res call({
 String applicationName, String packageName, int totalTimeInForeground, int lastTimeUsed, int firstTimeStamp, int describeContents, int totalTimeVisible, int lastTimeVisible, int totalTimeForegroundServiceUsed, int lastTimeForegroundServiceUsed, int lastTimeStamp
});




}
/// @nodoc
class _$AppUsageInfoCopyWithImpl<$Res>
    implements $AppUsageInfoCopyWith<$Res> {
  _$AppUsageInfoCopyWithImpl(this._self, this._then);

  final AppUsageInfo _self;
  final $Res Function(AppUsageInfo) _then;

/// Create a copy of AppUsageInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationName = null,Object? packageName = null,Object? totalTimeInForeground = null,Object? lastTimeUsed = null,Object? firstTimeStamp = null,Object? describeContents = null,Object? totalTimeVisible = null,Object? lastTimeVisible = null,Object? totalTimeForegroundServiceUsed = null,Object? lastTimeForegroundServiceUsed = null,Object? lastTimeStamp = null,}) {
  return _then(_self.copyWith(
applicationName: null == applicationName ? _self.applicationName : applicationName // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,totalTimeInForeground: null == totalTimeInForeground ? _self.totalTimeInForeground : totalTimeInForeground // ignore: cast_nullable_to_non_nullable
as int,lastTimeUsed: null == lastTimeUsed ? _self.lastTimeUsed : lastTimeUsed // ignore: cast_nullable_to_non_nullable
as int,firstTimeStamp: null == firstTimeStamp ? _self.firstTimeStamp : firstTimeStamp // ignore: cast_nullable_to_non_nullable
as int,describeContents: null == describeContents ? _self.describeContents : describeContents // ignore: cast_nullable_to_non_nullable
as int,totalTimeVisible: null == totalTimeVisible ? _self.totalTimeVisible : totalTimeVisible // ignore: cast_nullable_to_non_nullable
as int,lastTimeVisible: null == lastTimeVisible ? _self.lastTimeVisible : lastTimeVisible // ignore: cast_nullable_to_non_nullable
as int,totalTimeForegroundServiceUsed: null == totalTimeForegroundServiceUsed ? _self.totalTimeForegroundServiceUsed : totalTimeForegroundServiceUsed // ignore: cast_nullable_to_non_nullable
as int,lastTimeForegroundServiceUsed: null == lastTimeForegroundServiceUsed ? _self.lastTimeForegroundServiceUsed : lastTimeForegroundServiceUsed // ignore: cast_nullable_to_non_nullable
as int,lastTimeStamp: null == lastTimeStamp ? _self.lastTimeStamp : lastTimeStamp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AppUsageInfo].
extension AppUsageInfoPatterns on AppUsageInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUsageInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUsageInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUsageInfo value)  $default,){
final _that = this;
switch (_that) {
case _AppUsageInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUsageInfo value)?  $default,){
final _that = this;
switch (_that) {
case _AppUsageInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String applicationName,  String packageName,  int totalTimeInForeground,  int lastTimeUsed,  int firstTimeStamp,  int describeContents,  int totalTimeVisible,  int lastTimeVisible,  int totalTimeForegroundServiceUsed,  int lastTimeForegroundServiceUsed,  int lastTimeStamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUsageInfo() when $default != null:
return $default(_that.applicationName,_that.packageName,_that.totalTimeInForeground,_that.lastTimeUsed,_that.firstTimeStamp,_that.describeContents,_that.totalTimeVisible,_that.lastTimeVisible,_that.totalTimeForegroundServiceUsed,_that.lastTimeForegroundServiceUsed,_that.lastTimeStamp);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String applicationName,  String packageName,  int totalTimeInForeground,  int lastTimeUsed,  int firstTimeStamp,  int describeContents,  int totalTimeVisible,  int lastTimeVisible,  int totalTimeForegroundServiceUsed,  int lastTimeForegroundServiceUsed,  int lastTimeStamp)  $default,) {final _that = this;
switch (_that) {
case _AppUsageInfo():
return $default(_that.applicationName,_that.packageName,_that.totalTimeInForeground,_that.lastTimeUsed,_that.firstTimeStamp,_that.describeContents,_that.totalTimeVisible,_that.lastTimeVisible,_that.totalTimeForegroundServiceUsed,_that.lastTimeForegroundServiceUsed,_that.lastTimeStamp);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String applicationName,  String packageName,  int totalTimeInForeground,  int lastTimeUsed,  int firstTimeStamp,  int describeContents,  int totalTimeVisible,  int lastTimeVisible,  int totalTimeForegroundServiceUsed,  int lastTimeForegroundServiceUsed,  int lastTimeStamp)?  $default,) {final _that = this;
switch (_that) {
case _AppUsageInfo() when $default != null:
return $default(_that.applicationName,_that.packageName,_that.totalTimeInForeground,_that.lastTimeUsed,_that.firstTimeStamp,_that.describeContents,_that.totalTimeVisible,_that.lastTimeVisible,_that.totalTimeForegroundServiceUsed,_that.lastTimeForegroundServiceUsed,_that.lastTimeStamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppUsageInfo implements AppUsageInfo {
  const _AppUsageInfo({required this.applicationName, required this.packageName, required this.totalTimeInForeground, required this.lastTimeUsed, required this.firstTimeStamp, required this.describeContents, required this.totalTimeVisible, required this.lastTimeVisible, required this.totalTimeForegroundServiceUsed, required this.lastTimeForegroundServiceUsed, required this.lastTimeStamp});
  factory _AppUsageInfo.fromJson(Map<String, dynamic> json) => _$AppUsageInfoFromJson(json);

@override final  String applicationName;
@override final  String packageName;
@override final  int totalTimeInForeground;
@override final  int lastTimeUsed;
@override final  int firstTimeStamp;
@override final  int describeContents;
@override final  int totalTimeVisible;
@override final  int lastTimeVisible;
@override final  int totalTimeForegroundServiceUsed;
@override final  int lastTimeForegroundServiceUsed;
@override final  int lastTimeStamp;

/// Create a copy of AppUsageInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUsageInfoCopyWith<_AppUsageInfo> get copyWith => __$AppUsageInfoCopyWithImpl<_AppUsageInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppUsageInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUsageInfo&&(identical(other.applicationName, applicationName) || other.applicationName == applicationName)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.totalTimeInForeground, totalTimeInForeground) || other.totalTimeInForeground == totalTimeInForeground)&&(identical(other.lastTimeUsed, lastTimeUsed) || other.lastTimeUsed == lastTimeUsed)&&(identical(other.firstTimeStamp, firstTimeStamp) || other.firstTimeStamp == firstTimeStamp)&&(identical(other.describeContents, describeContents) || other.describeContents == describeContents)&&(identical(other.totalTimeVisible, totalTimeVisible) || other.totalTimeVisible == totalTimeVisible)&&(identical(other.lastTimeVisible, lastTimeVisible) || other.lastTimeVisible == lastTimeVisible)&&(identical(other.totalTimeForegroundServiceUsed, totalTimeForegroundServiceUsed) || other.totalTimeForegroundServiceUsed == totalTimeForegroundServiceUsed)&&(identical(other.lastTimeForegroundServiceUsed, lastTimeForegroundServiceUsed) || other.lastTimeForegroundServiceUsed == lastTimeForegroundServiceUsed)&&(identical(other.lastTimeStamp, lastTimeStamp) || other.lastTimeStamp == lastTimeStamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationName,packageName,totalTimeInForeground,lastTimeUsed,firstTimeStamp,describeContents,totalTimeVisible,lastTimeVisible,totalTimeForegroundServiceUsed,lastTimeForegroundServiceUsed,lastTimeStamp);

@override
String toString() {
  return 'AppUsageInfo(applicationName: $applicationName, packageName: $packageName, totalTimeInForeground: $totalTimeInForeground, lastTimeUsed: $lastTimeUsed, firstTimeStamp: $firstTimeStamp, describeContents: $describeContents, totalTimeVisible: $totalTimeVisible, lastTimeVisible: $lastTimeVisible, totalTimeForegroundServiceUsed: $totalTimeForegroundServiceUsed, lastTimeForegroundServiceUsed: $lastTimeForegroundServiceUsed, lastTimeStamp: $lastTimeStamp)';
}


}

/// @nodoc
abstract mixin class _$AppUsageInfoCopyWith<$Res> implements $AppUsageInfoCopyWith<$Res> {
  factory _$AppUsageInfoCopyWith(_AppUsageInfo value, $Res Function(_AppUsageInfo) _then) = __$AppUsageInfoCopyWithImpl;
@override @useResult
$Res call({
 String applicationName, String packageName, int totalTimeInForeground, int lastTimeUsed, int firstTimeStamp, int describeContents, int totalTimeVisible, int lastTimeVisible, int totalTimeForegroundServiceUsed, int lastTimeForegroundServiceUsed, int lastTimeStamp
});




}
/// @nodoc
class __$AppUsageInfoCopyWithImpl<$Res>
    implements _$AppUsageInfoCopyWith<$Res> {
  __$AppUsageInfoCopyWithImpl(this._self, this._then);

  final _AppUsageInfo _self;
  final $Res Function(_AppUsageInfo) _then;

/// Create a copy of AppUsageInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationName = null,Object? packageName = null,Object? totalTimeInForeground = null,Object? lastTimeUsed = null,Object? firstTimeStamp = null,Object? describeContents = null,Object? totalTimeVisible = null,Object? lastTimeVisible = null,Object? totalTimeForegroundServiceUsed = null,Object? lastTimeForegroundServiceUsed = null,Object? lastTimeStamp = null,}) {
  return _then(_AppUsageInfo(
applicationName: null == applicationName ? _self.applicationName : applicationName // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,totalTimeInForeground: null == totalTimeInForeground ? _self.totalTimeInForeground : totalTimeInForeground // ignore: cast_nullable_to_non_nullable
as int,lastTimeUsed: null == lastTimeUsed ? _self.lastTimeUsed : lastTimeUsed // ignore: cast_nullable_to_non_nullable
as int,firstTimeStamp: null == firstTimeStamp ? _self.firstTimeStamp : firstTimeStamp // ignore: cast_nullable_to_non_nullable
as int,describeContents: null == describeContents ? _self.describeContents : describeContents // ignore: cast_nullable_to_non_nullable
as int,totalTimeVisible: null == totalTimeVisible ? _self.totalTimeVisible : totalTimeVisible // ignore: cast_nullable_to_non_nullable
as int,lastTimeVisible: null == lastTimeVisible ? _self.lastTimeVisible : lastTimeVisible // ignore: cast_nullable_to_non_nullable
as int,totalTimeForegroundServiceUsed: null == totalTimeForegroundServiceUsed ? _self.totalTimeForegroundServiceUsed : totalTimeForegroundServiceUsed // ignore: cast_nullable_to_non_nullable
as int,lastTimeForegroundServiceUsed: null == lastTimeForegroundServiceUsed ? _self.lastTimeForegroundServiceUsed : lastTimeForegroundServiceUsed // ignore: cast_nullable_to_non_nullable
as int,lastTimeStamp: null == lastTimeStamp ? _self.lastTimeStamp : lastTimeStamp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
