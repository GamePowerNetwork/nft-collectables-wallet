import 'package:json_annotation/json_annotation.dart';

part 'app_channel.g.dart';

@JsonKey(defaultValue: AppChannelMessageType.none)
enum AppChannelMessageType { 
  @JsonValue("none") none,
  @JsonValue("state") state, 
}

@JsonSerializable()
class AppChannel {
  final String name;
  AppChannelMessageType messageType;

  AppChannel({
    required this.name,
    this.messageType = AppChannelMessageType.none,
  });

  factory AppChannel.fromJson(Map<String, dynamic> item) => _$AppChannelFromJson(item);
  Map<String, dynamic> toJson() => _$AppChannelToJson(this);
}