import 'package:json_annotation/json_annotation.dart';

abstract class Channel {
  final String name = "blah";
  final String requestMethod = "blah";

  @JsonKey(ignore: true)
  late Function callback;

}