import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BulbScreen extends StatefulWidget {
  const BulbScreen({super.key});

  @override
  State<BulbScreen> createState() => _BulbScreenState();
}

class _BulbScreenState extends State<BulbScreen> {
  bool _switchOn = false;

  @override
  void initState() {
    readStoredState();
    super.initState();
  }

  readStoredState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _switchOn = prefs.getBool('SWITCH') ?? false;
    setState(() {});
  }

  void _switchBulb(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('SWITCH', value);

    // The 'value' is already inverse of whatever is passed earlier in the Switch value.
    // So, we will just use this and discard the below conversion.
    // _switchOn = !_switchOn!;

    // _switchOn = prefs.getBool('SWITCH') ?? false;
    // Since, I know some value will be assigned, so will use the below statement.
    _switchOn = prefs.getBool('SWITCH')!;

    setState(() {});
  }

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
                    onChanged: _switchBulb,
                  ),
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
