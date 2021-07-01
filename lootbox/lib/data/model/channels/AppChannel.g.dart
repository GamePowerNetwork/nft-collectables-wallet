// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppChannel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppChannel _$AppChannelFromJson(Map<String, dynamic> json) {
  return AppChannel(
    name: json['name'] as String,
    state: _$enumDecode(_$AppCurrentStateEnumMap, json['state']),
  );
}

Map<String, dynamic> _$AppChannelToJson(AppChannel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'state': _$AppCurrentStateEnumMap[instance.state],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$AppCurrentStateEnumMap = {
  AppCurrentState.initial: 'initial',
  AppCurrentState.loading: 'loading',
  AppCurrentState.ready: 'ready',
};
