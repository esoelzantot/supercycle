import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

enum DevicePlatform { web, android, ios, windows, macOS, linux, unknown }

DevicePlatform getCurrentPlatform() {
  if (kIsWeb) return DevicePlatform.web;

  if (Platform.isAndroid) return DevicePlatform.android;
  if (Platform.isIOS) return DevicePlatform.ios;
  if (Platform.isWindows) return DevicePlatform.windows;
  if (Platform.isMacOS) return DevicePlatform.macOS;
  if (Platform.isLinux) return DevicePlatform.linux;

  return DevicePlatform.unknown;
}
