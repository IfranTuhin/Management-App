import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:management_app/FirebaseDatabase/database_provider.dart';
import 'package:management_app/Screen/splash_screen.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCpD1P52nl15efVTgmt3mlEM3NTrCEqkE4",
      authDomain: "management-app-b5aa4.firebaseapp.com",
      projectId: "management-app-b5aa4",
      storageBucket: "management-app-b5aa4.appspot.com",
      messagingSenderId: "756239267894",
      appId: "1:756239267894:web:4d2b8e597863280b884097",
    ),
  );

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => DatabaseProvider(),)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Management App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
