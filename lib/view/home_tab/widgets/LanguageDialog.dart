import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Language'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('English'),
            onTap: () {
              _changeLanguage(Locale('en', 'US'));
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text('Bengali'),
            onTap: () {
              _changeLanguage(Locale('bn', 'BD'));
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _changeLanguage(Locale locale) {
    Get.updateLocale(locale);
  }
}