import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_thai_hotline_app/views/splash_screen_ui.dart';

void main() {
  runApp(
    FlutterThaiHotlineApp(),
  );
}

class FlutterThaiHotlineApp extends StatefulWidget {
  const FlutterThaiHotlineApp({super.key});

  @override
  State<FlutterThaiHotlineApp> createState() => _FlutterThaiHotlineAppState();
}

class _FlutterThaiHotlineAppState extends State<FlutterThaiHotlineApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.krubTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
