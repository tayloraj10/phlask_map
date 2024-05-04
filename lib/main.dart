import 'package:flutter/material.dart';
import 'package:phlask_map/screens/loading.dart';
import 'package:phlask_map/screens/map_page.dart';
import 'package:provider/provider.dart';
import 'models/app_data.dart';
import 'models/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppData>(
          create: (_) => AppData(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const LoadingPage(),
          '/map': (context) => const MapPage(),
          '/mission': (context) => const MapPage(),
          '/project': (context) => const MapPage(),
          '/share': (context) => const MapPage(),
          '/contribute': (context) => const MapPage()
        },
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(
          useMaterial3: true,
          dialogTheme: const DialogTheme(
            surfaceTintColor: Colors.white,
          ),
          cardTheme: const CardTheme(surfaceTintColor: Colors.white),
          appBarTheme: const AppBarTheme(
              color: Colors.white, foregroundColor: primaryColor),
          primaryColor: const Color.fromARGB(255, 27, 48, 28),
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
          ),
        ),
      ),
    );
  }
}
