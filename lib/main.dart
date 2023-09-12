import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginpage.dart';

import 'package:flutter_application_1/dbhelper/mongobd.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await MongoDatabase.connect();
    runApp(const MyApp());
  } catch (error) {
    print('Error connecting to MongoDB: $error');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NSS ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 73, 11, 197)),
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
