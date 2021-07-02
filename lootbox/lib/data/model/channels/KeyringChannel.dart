import 'package:lootbox_wallet/common/constants/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'KeyringChannel.g.dart';

@JsonSerializable()
class KeyringChannel {
  final String name;

  @JsonKey(defaultValue: "")
  String method;

  @JsonKey(toJson: toNull, includeIfNull: false)
  String phrase = '';

  KeyringChannel({
    required this.name,
    this.phrase = '',
    this.method = '',
  });

  factory KeyringChannel.fromJson(Map<String, dynamic> item) => _$KeyringChannelFromJson(item);
  Map<String, dynamic> toJson() => _$KeyringChannelToJson(this);
}