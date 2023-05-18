import 'package:core_folders/core/flavors/flavor_lib.dart';

class DevFlavor extends Flavor {
  DevFlavor()
      : super(
          baseUrl: "",
          baseWebViewUrl: "",
          identityServerUrl: "",
          flavorType: FlavorType.development,
        );
}
