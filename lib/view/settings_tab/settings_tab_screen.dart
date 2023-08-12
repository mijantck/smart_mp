import 'package:flutter/material.dart';

class SettingsTabScreen extends StatefulWidget {
  const SettingsTabScreen({super.key});

  @override
  State<SettingsTabScreen> createState() => _SettingsTabScreenState();
}

class _SettingsTabScreenState extends State<SettingsTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Settings'
        ),
      ),
    );
  }
}

