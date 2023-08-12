import 'package:flutter/material.dart';
import 'package:smart_mp/models/respons/ESebahModel.dart';
import 'package:smart_mp/utils/AppString.dart';
import 'package:url_launcher/url_launcher.dart';

class EShebaItemView extends StatelessWidget {
  final ESebahModel eSheba;

  EShebaItemView({required this.eSheba});

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(AppString.IMAGE_URL+eSheba.imageUrl!),
      title: Text(eSheba!.name!),
      subtitle: Text(eSheba.url!),
      onTap: () {
        _launchURL(eSheba.url!);
      },
    );
  }
}