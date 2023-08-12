import 'package:flutter/material.dart';

class MoreTabScreen extends StatefulWidget {
  const MoreTabScreen({super.key});

  @override
  State<MoreTabScreen> createState() => _MoreTabScreenState();
}

class _MoreTabScreenState extends State<MoreTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            'More'
        ),
      ),
    );
  }
}
