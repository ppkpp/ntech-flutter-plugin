import 'ntechplugin_platform_interface.dart';

class Ntechplugin {
  Future<String?> endPhoneCall() {
    return NtechpluginPlatform.instance.endPhoneCall();
  }
}
