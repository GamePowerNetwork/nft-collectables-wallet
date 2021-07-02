import 'package:json_annotation/json_annotation.dart';

part 'AppChannel.g.dart';

enum AppCurrentState { 
  @JsonValue("initial") initial, 
  @JsonValue("loading") loading, 
  @JsonValue("ready") ready 
}

@JsonKey(defaultValue: AppChannelMessageType.none)
enum AppChannelMessageType { 
  @JsonValue("none") none,
  @JsonValue("state") state, 
}

@JsonSerializable()
class AppChannel {
  final String name;
  AppCurrentState state;
  AppChannelMessageType messageType;

  AppChannel({
    required this.name,
    this.state = AppCurrentState.initial,
    this.messageType = AppChannelMessageType.none,
  });

  factory AppChannel.fromJson(Map<String, dynamic> item) => _$AppChannelFromJson(item);
  Map<String, dynamic> toJson() => _$AppChannelToJson(this);
}