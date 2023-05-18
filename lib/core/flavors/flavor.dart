import 'package:core_folders/core/flavors/flavor_lib.dart';

abstract class Flavor {
  final String baseUrl;
  final String baseWebViewUrl;
  final String identityServerUrl;
  final FlavorType flavorType;

  Flavor({required this.baseUrl, required this.baseWebViewUrl, required this.identityServerUrl, required this.flavorType});

  static final Flavor development = DevFlavor();
  static final Flavor testing = TestingFlavor();
}

enum FlavorType { development, testing }
