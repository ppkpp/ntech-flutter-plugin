import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ntechplugin_method_channel.dart';

abstract class NtechpluginPlatform extends PlatformInterface {
  /// Constructs a NtechpluginPlatform.
  NtechpluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static NtechpluginPlatform _instance = MethodChannelNtechplugin();

  /// The default instance of [NtechpluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelNtechplugin].
  static NtechpluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NtechpluginPlatform] when
  /// they register themselves.
  static set instance(NtechpluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> endPhoneCall() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
