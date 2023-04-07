import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ntechplugin_platform_interface.dart';

/// An implementation of [NtechpluginPlatform] that uses method channels.
class MethodChannelNtechplugin extends NtechpluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ntechplugin');

  @override
  Future<String?> endPhoneCall() async {
    final version = await methodChannel.invokeMethod<String>('endPhoneCall');
    return version;
  }
}
