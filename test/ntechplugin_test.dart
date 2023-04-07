import 'package:flutter_test/flutter_test.dart';
import 'package:ntechplugin/ntechplugin.dart';
import 'package:ntechplugin/ntechplugin_platform_interface.dart';
import 'package:ntechplugin/ntechplugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNtechpluginPlatform
    with MockPlatformInterfaceMixin
    implements NtechpluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NtechpluginPlatform initialPlatform = NtechpluginPlatform.instance;

  test('$MethodChannelNtechplugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNtechplugin>());
  });

  test('getPlatformVersion', () async {
    Ntechplugin ntechpluginPlugin = Ntechplugin();
    MockNtechpluginPlatform fakePlatform = MockNtechpluginPlatform();
    NtechpluginPlatform.instance = fakePlatform;

    expect(await ntechpluginPlugin.getPlatformVersion(), '42');
  });
}
