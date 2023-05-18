import 'package:core_folders/core/flavors/flavor_lib.dart';

class TestingFlavor extends Flavor {
  TestingFlavor()
      : super(
          baseUrl: "",
          baseWebViewUrl: "",
          identityServerUrl: "",
          flavorType: FlavorType.testing,
        );
}
