import 'package:flutter/material.dart';
import 'package:tiktokclone/screens/homescreen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          primary: const Color(0xFFE9435A),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
