import 'package:flutter/material.dart';

import 'screens/bday_screen.dart';
import 'screens/home_screen.dart';
import 'screens/miss_screen.dart';
import 'screens/store_screen.dart';

void main() {
  runApp(const GiftApp());
}

class GiftApp extends StatelessWidget {
  const GiftApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gifts',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/store': (context) => const StoreScreen(),
        // '/motivation': (context) => const MotivationScreen(),
        '/bday': (context) => const BdayScreen(),
        // '/lonely': (context) => const LonelyScreen(),
        '/miss': (context) => const MissScreen(),
        // '/pissed': (context) => const PissedScreen(),
        // '/sad': (context) => const SadScreen(),
      },
      theme: ThemeData(fontFamily: 'Poppins'),
      //home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC79D9D),
      body: Center(
        child: Text("Gift App starting", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
