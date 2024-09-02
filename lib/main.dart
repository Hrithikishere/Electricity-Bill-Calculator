import 'package:electricity_bill_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 12),
          prefixStyle: TextStyle(fontSize: 12),
          border: const OutlineInputBorder(),
          constraints: BoxConstraints(maxWidth: (size * 0.9)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            textStyle: const TextStyle(),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
