import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_recipes/pages/categories/page_categories.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF00ff00));

void main() {
  runApp(const RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipes app',
      home: PageCategories(),
      theme: ThemeData().copyWith(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 48,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            shadows: [
              Shadow(
                offset: Offset(3.0, 3.0),
                blurRadius: 10.0,
                color: Color.fromARGB(200, 0, 0, 0),
              ),
              Shadow(
                offset: Offset(-3.0, 3.0),
                blurRadius: 10.0,
                color: Color.fromARGB(200, 0, 0, 0),
              ),
              Shadow(
                offset: Offset(3.0, -3.0),
                blurRadius: 10.0,
                color: Color.fromARGB(200, 0, 0, 0),
              ),
              Shadow(
                offset: Offset(-3.0, -3.0),
                blurRadius: 10.0,
                color: Color.fromARGB(200, 0, 0, 0),
              ),
            ],
          ),
          bodySmall: TextStyle(
            color: Colors.white.withValues(alpha: 0.9),
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onSurfaceVariant,
          titleTextStyle: TextStyle().copyWith(
            color: kColorScheme.surfaceBright,
            fontSize: 22,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        scaffoldBackgroundColor: kColorScheme.onSurface,
        colorScheme: kColorScheme,
      ),
    );
  }
}
