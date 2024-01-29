import 'package:flutter/material.dart';
import 'package:switch_bulb_app/screens/bulb_screen.dart';

void main() {
  runApp(const SwitchBulbApp());
}

class SwitchBulbApp extends StatelessWidget {
  const SwitchBulbApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BulbScreen(),
    );
  }
}
