import 'package:json_annotation/json_annotation.dart';

part 'AppChannel.g.dart';

enum AppCurrentState { 
  @JsonValue("initial") initial, 
  @JsonValue("loading") loading, 
  @JsonValue("ready") ready 
}

@JsonSerializable()
class AppChannel {
  final String name;
  AppCurrentState state;

  AppChannel({
    required this.name,
    this.state = AppCurrentState.initial,
  });

  factory AppChannel.fromJson(Map<String, dynamic> item) => _$AppChannelFromJson(item);
  Map<String, dynamic> toJson() => _$AppChannelToJson(this);
}