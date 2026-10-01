import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:help_instruction_app/screens/category_screen.dart'; 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Receipe App',
      debugShowCheckedModeBanner: false,
      home: CategoryScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 180, 11, 57),),
        textTheme: ThemeData.light().textTheme.apply(fontFamily: GoogleFonts.lato().fontFamily,), 
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme( 
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0, 
          titleTextStyle: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),  
    );
  }
}
