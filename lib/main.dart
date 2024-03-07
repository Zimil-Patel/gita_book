import 'package:flutter/material.dart';
import 'package:gita_book/screens/Adhyay/chapter_list_ui.dart';
import 'package:gita_book/screens/Adhyay/shlok_list_ui.dart';
import 'package:gita_book/screens/aaratee/gita_aaratee.dart';
import 'package:gita_book/screens/gitasaar/gita_saar.dart';
import 'package:gita_book/screens/home/home_screen.dart';
import 'package:gita_book/screens/maahaatmy/gita_maahaatmy.dart';
import 'package:gita_book/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //routes
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/chapters': (context) => const ChaptersList(),
        '/shloks': (context) => const ShlokList(),
        '/saar': (context) => const GitaSaar(),
        '/maahaatmy': (context) => const Maahaatmy(),
        '/aaratee': (context) => const Aaratee(),
      },
    );
  }
}
