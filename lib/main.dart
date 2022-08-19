import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify/actions/auth/auth_action.dart';
import 'package:spotify/data/api/api_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spotify/data/app_repository.dart';
import 'package:spotify/data/preference_client.dart';
import 'package:spotify/i18n/localisation_service.dart';
import 'package:spotify/middleware/middleware.dart';
import 'package:spotify/models/models.dart';
import 'package:spotify/reducers/reducers.dart';
import 'package:spotify/theme.dart';
import 'package:spotify/views/init_page.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await dotenv.load(fileName: ".env");
  final AppRepository repository = AppRepository(
      preferencesClient: PreferencesClient(prefs: prefs),
      config: ApiRoutes.debugConfig);
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    MyApp(
      repository: repository,
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key, required AppRepository repository})
      : store = Store<AppState>(
          reducer,
          middleware: middleware(repository),
          initialState: AppState.initState(),
        ),
        super(key: key);

  final Store<AppState> store;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = widget.store;
    _init();
  }

  void _init() {
    Future<void>.delayed(Duration(seconds: 2), () {
      store.dispatch(new CheckForUserInPrefs());
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        navigatorKey: store.state.navigator,
        title: 'Spotify',
        theme: themeData,
        home: InitPage(),
        localeResolutionCallback: LocalisationService.localeResolutionCallBack,
        supportedLocales: LocalisationService.supportedLocales,
        localizationsDelegates: LocalisationService.localizationsDelegate,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
