import 'package:core_folders/app_lib.dart';

// service locator
final serviceLocator = GetIt.instance;

Future<void> initServiceLocator({required Flavor flavorType}) async {

  // flavor
  serviceLocator.registerLazySingleton<Flavor>(() => flavorType);

  // package
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  serviceLocator.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true)));
  serviceLocator.registerLazySingleton<InternetConnectionCheckerPlus>(() => InternetConnectionCheckerPlus());
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator.registerLazySingleton<ImagePicker>(() => ImagePicker());
  serviceLocator.registerLazySingleton<FilePicker>(() => FilePicker.platform);

  // services
  serviceLocator.registerLazySingleton<NetworkService>(() => NetworkServiceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<FirebaseService>(() => FirebaseServiceImpl());
  serviceLocator.registerLazySingleton<ActionExecutorService>(() => ActionExecutorServiceImpl(connectivityService: serviceLocator(), dialogService: serviceLocator(), navigationService: serviceLocator()));
  serviceLocator.registerLazySingleton<CacheService>(() => CacheService(serviceLocator(), serviceLocator()));
  serviceLocator.registerLazySingleton<ConfigurationsService>(() => ConfigurationsService());
  serviceLocator.registerLazySingleton<ThemeService>(() => ThemeServiceImpl());
  serviceLocator.registerLazySingleton<LanguageService>(() => LanguageServiceImpl());
  serviceLocator.registerLazySingleton<DialogService>(() => DialogImplService());
  serviceLocator.registerLazySingleton<PermissionService>(() => PermissionServiceImpl());
  serviceLocator.registerLazySingleton<HttpService>(() => HttpServiceImpl());
  serviceLocator.registerLazySingleton<NavigationService>(() => NavigationServiceImpl());
  serviceLocator.registerLazySingleton<SafeDeviceController>(() => SafeDeviceServiceImpl());
  serviceLocator.registerLazySingleton<EncryptionService>(() => EncryptionServiceImpl());
  serviceLocator.registerLazySingleton<PickImageVideoService>(() => PickImageVideoServiceImpl());
  serviceLocator.registerLazySingleton<PickFileService>(() => PickFileServiceImpl());
  serviceLocator.registerLazySingleton<LookupsService>(() => LookupsServiceImpl());
  serviceLocator.registerLazySingleton<FilesServices>(() => FilesServicesImpl());

  // repo and repo impl


  // usecase

  // utils
  serviceLocator.registerLazySingleton<AppUtils>(() => AppUtils());
  serviceLocator.registerLazySingleton<FailureHandler>(() => FailureHandler());
}