import 'package:flutter/material.dart';
import 'package:phlask_map/screens/loading.dart';
import 'package:provider/provider.dart';
import 'models/app_data.dart';
import 'models/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(
          useMaterial3: true,
          dialogTheme: const DialogTheme(
            surfaceTintColor: Colors.white,
          ),
          cardTheme: const CardTheme(surfaceTintColor: Colors.white),
          appBarTheme: const AppBarTheme(
              color: primaryColor, foregroundColor: Colors.white),
          primaryColor: const Color.fromARGB(255, 27, 48, 28),
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
            // primary: const Color.fromARGB(255, 15, 111, 18),
          ),
        ),
        home: const Scaffold(
          body: SafeArea(
            child: LoadingPage(),
          ),
        ),
      ),
    );
  }
}
