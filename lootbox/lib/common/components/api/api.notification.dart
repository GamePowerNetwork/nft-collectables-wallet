import 'package:flutter/material.dart';
import 'package:gamepower_wallet/common/components/api/api.model.dart';

class ApiRequestNotification extends Notification {
  RequestData request;

  ApiRequestNotification(this.request);
}