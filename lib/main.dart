// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:instagram_clone/features/presentation/pages/credentialpages/signIn_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_clone/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const SigninPage(),
    );
  }
}
