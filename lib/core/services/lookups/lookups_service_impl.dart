import 'package:core_folders/app_lib.dart';

class LookupsServiceImpl with Observable implements LookupsService {

  @override
  Future<void> getLookups() async {

    notifyListeners();
  }
}