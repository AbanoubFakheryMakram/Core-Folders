import 'package:core_folders/app_lib.dart';

abstract class LookupsService implements Observable {
  Future<void> getLookups();


}
