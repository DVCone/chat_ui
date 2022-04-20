import 'package:chatui/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final ThemeData theme = ThemeData();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatUi',

      // Theme Style
      theme: ThemeData(
        colorScheme:
            theme.colorScheme.copyWith(
              primary: Colors.red,
              secondary: const Color(0xFFFEF9EB),
            ),
      ),
      
      // Home
      home: const HomeScreen(),
    );
  }
}
