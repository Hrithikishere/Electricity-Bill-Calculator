import 'package:electricity_bill_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
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
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blue[900]),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(fontSize: 12),
          prefixStyle: const TextStyle(fontSize: 12),
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[100],
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          constraints: BoxConstraints(maxWidth: (size * 0.9)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            textStyle: const TextStyle(),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
