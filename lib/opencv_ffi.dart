import 'dart:async';

import 'package:flutter/services.dart';

class OpencvFfi {
  static const MethodChannel _channel = MethodChannel('opencv_ffi');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
