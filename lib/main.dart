import 'package:flutter/material.dart';
import 'View/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isdark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      darkTheme: darkTheme,
      themeMode: isdark ? ThemeMode.dark : ThemeMode.light,
      home: MyHomePage(
        title: 'BMI Calculator',
        toggleTheme: toggleTheme,
        isDark: isdark,
      ),
    );
  }

  void toggleTheme() {
    setState(() {
      isdark = !isdark; // Toggle between dark and light themes
    });
  }
}

ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF5A67D8), // Purple
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color.fromARGB(
        255, 151, 231, 227), // Green (formerly accentColor)
    surface: const Color(0xFFF7FAFC), // Light Gray for elements
  ),
  scaffoldBackgroundColor:
      const Color(0xFFF7FAFC), // Background for the whole app
  cardColor: const Color(0xFFEDF2F7), // Light Gray for containers
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFF2D3748), // Dark Gray for titles
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Color(0xFF2D3748), // Dark Gray for section headers
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Color(0xFF718096), // Medium Gray for body text
    ),
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white, // White text for buttons
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF5A67D8), // Primary button color (Purple)
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded button corners
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF5A67D8), // Purple AppBar
    elevation: 5,
    shadowColor: Colors.black54, // Subtle shadow for AppBar
    titleTextStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white, // White text in the AppBar
    ),
    iconTheme: IconThemeData(
      color: Colors.white, // White icons in AppBar
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: const Color(0xFF5A67D8), // Purple
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
  ).copyWith(
    secondary:
        const Color.fromARGB(255, 151, 231, 227), // Green as the accent color
    surface: const Color(0xFF2D3748), // Dark Gray for elements
  ),
  scaffoldBackgroundColor:
      const Color(0xFF1A202C), // Dark background for the whole app
  cardColor: const Color(0xFF2D3748), // Darker Gray for containers
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFFF7FAFC), // Light Gray for titles
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Color(0xFFF7FAFC), // Light Gray for section headers
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Color(0xFFCBD5E0), // Lighter Gray for body text
    ),
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white, // White text for buttons
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF5A67D8), // Purple for buttons
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners for buttons
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF5A67D8), // Purple AppBar
    elevation: 5,
    shadowColor: Colors.black54, // Subtle shadow for AppBar
    titleTextStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white, // White text in the AppBar
    ),
    iconTheme: IconThemeData(
      color: Colors.white, // White icons in AppBar
    ),
  ),
);
