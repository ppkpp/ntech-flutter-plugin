import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ntechplugin/ntechplugin_method_channel.dart';

void main() {
  MethodChannelNtechplugin platform = MethodChannelNtechplugin();
  const MethodChannel channel = MethodChannel('ntechplugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
