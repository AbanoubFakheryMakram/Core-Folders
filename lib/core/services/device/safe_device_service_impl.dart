import 'package:core_folders/app_lib.dart';

class SafeDeviceServiceImpl implements SafeDeviceController {

  @override
  Future<bool> isDeviceJailbroken() async {
    return await SafeDevice.isJailBroken;
  }

  @override
  Future<bool> isSafeDevice() async {
    // is not rooted
    return (await SafeDevice.isSafeDevice);
  }

  @override
  Future<bool> isRealDevice() async {
    return await SafeDevice.isRealDevice;
  }

  @override
  Future<bool> canRunTheAppOnThisDevice() async {
    if (kReleaseMode) {
      return (await isRealDevice()) && (!await isDeviceJailbroken());
    } else {
      return true;
    }
  }
}