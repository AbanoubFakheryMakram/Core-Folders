import 'package:core_folders/app_lib.dart';

class NetworkServiceImpl implements NetworkService {
  final InternetConnectionCheckerPlus connectionChecker;

  NetworkServiceImpl(this.connectionChecker);

  @override
  Future<bool> get hasConnection => connectionChecker.hasConnection;
}