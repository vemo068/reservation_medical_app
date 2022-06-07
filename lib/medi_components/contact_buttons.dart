import 'package:flutter/material.dart';
import 'package:reservation_medical_app/models/doctor.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactButtons extends StatelessWidget {
  final String phone;
  final String mapUrl;
  final String email;
  ContactButtons(
      {Key? key,
      required this.phone,
      required this.email,
      required this.mapUrl})
      : super(key: key);
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> sendEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Question About Doctor  ',
      }),
    );

    await launchUrl(emailLaunchUri);
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              _makePhoneCall(phone);
            },
            color: Colors.white,
            height: 40,
            minWidth: 40,
            child: Icon(Icons.call_outlined),
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              _launchInBrowser(Uri.parse(mapUrl));
            },
            color: Colors.white,
            height: 40,
            minWidth: 40,
            child: Icon(Icons.location_on_outlined),
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              sendEmail(email);
            },
            color: Colors.white,
            height: 40,
            minWidth: 40,
            child: Icon(Icons.mail_outline),
          ),
        ],
      ),
    );
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
