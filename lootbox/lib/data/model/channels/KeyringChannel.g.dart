// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KeyringChannel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KeyringChannel _$KeyringChannelFromJson(Map<String, dynamic> json) {
  return KeyringChannel(
    name: json['name'] as String,
    phrase: json['phrase'] as String? ?? '',
    method: json['method'] as String? ?? '',
  );
}

Map<String, dynamic> _$KeyringChannelToJson(KeyringChannel instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'method': instance.method,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phrase', toNull(instance.phrase));
  return val;
}
