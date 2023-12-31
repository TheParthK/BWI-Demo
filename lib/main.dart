import 'package:bwi_demo2/Pages/category_page.dart';
import 'package:bwi_demo2/Pages/landing_page.dart';
import 'package:bwi_demo2/Pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Services/firebase_options.dart';
import 'Pages/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const LandingPage();
            // return const CategoryPage();
          }
          return const LoginPage();
        },
      ),
      // home: LoginPage(),
    );
  }
}