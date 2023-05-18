import 'dart:async';
import 'package:core_folders/app_lib.dart';
import 'package:core_folders/main.dart';

// run specific flavor
// flutter build apk --flavor dev -t lib/src/flavors/{file_name}.dart

void mainCommon(Flavor flavor) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // initialize firebase
    await Firebase.initializeApp();

    // init service locator
    await initServiceLocator(flavorType: flavor);

    // if you wand to force a crash to test firebase crashlytics set this bool var to true
    bool forceCrash = false;
    if (forceCrash) {
      serviceLocator<FirebaseService>().makeCrash();
    }

    // set app orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // load app settings
    ConfigurationsService configService = serviceLocator<ConfigurationsService>();
    await configService.loadSettings();

    runApp(
      ProviderScope(child: MyApp()),
    );
  }, (error, stackTrace) => serviceLocator<FirebaseService>().recordErrorToFirebase(error, stackTrace, ""));
}