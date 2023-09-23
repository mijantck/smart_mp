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

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('একটি বিকল্প চয়ন করুন'),
          content: Text('আপনি কী করতে চান?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _launchURL(eSheba.url!); // Handle visiting the website
              },
              child: Text('ওয়েবসাইট দেখুন'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _launchDialer(eSheba.phone == null ? '999' : eSheba.phone!,); // Handle calling the number
              },
              child: Text('কল করুন'),
            ),
          ],
        );
      },
    );
  }

  void _launchDialer(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunch(phoneLaunchUri.toString())) {
      await launch(phoneLaunchUri.toString());
    } else {
      print('Could not launch dialer.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        child: InkWell(
          onTap: () {
            _showOptionsDialog(context); // Show the dialog on tap
          },
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                child: Image.network(AppString.IMAGE_URL+eSheba.imageUrl!),
              ),
              SizedBox(width: 10,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(eSheba!.name!),
                    SizedBox(height: 5),
                    Container(
                      child: Text(
                        eSheba.url!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      eSheba.phone == null ? '999' : eSheba.phone!,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}