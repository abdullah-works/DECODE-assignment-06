import 'package:flutter/material.dart';

class BulbScreen extends StatefulWidget {
  const BulbScreen({super.key});

  @override
  State<BulbScreen> createState() => _BulbScreenState();
}

class _BulbScreenState extends State<BulbScreen> {
  bool _switchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          'Bulb Switch',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: (_switchOn) ? Colors.black87 : Colors.white24,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.lightbulb,
                    size: 200,
                    color: (_switchOn) ? Colors.amber : Colors.black,
                  ),
                  const SizedBox(height: 20),
                  Switch(
                      value: _switchOn,
                      onChanged: (value) {
                        setState(() {
                          _switchOn = value;
                        });
                      }),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: (_switchOn) ? Colors.amber : Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                (_switchOn) ? 'ON' : 'OFF',
                style: TextStyle(
                  color: (_switchOn) ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
