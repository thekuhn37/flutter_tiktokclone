import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/features/main_navigation/main_navigation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
      theme: ThemeData(
        // 여기서 전체적인 컨트롤 센터 역할을 할 수 있다.
        scaffoldBackgroundColor: Colors.white,
        // 이렇게 하면 모든 scaffold 배경색 한번에 변경된다.
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(
            0xFFE9435A,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          onPrimary: const Color(0xFFE9435A),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: Sizes.size16 + Sizes.size2,
            // 이렇게 더해줄 수도 있다.
          ),
        ),
        useMaterial3: true,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: const MainNavigationScreen(),
    );
  }
}
