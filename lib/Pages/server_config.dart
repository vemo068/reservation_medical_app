import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';
import 'package:reservation_medical_app/medi_components/mediappbar.dart';
import 'package:reservation_medical_app/utils/links.dart';

class ServerConfig extends StatelessWidget {
  ServerConfig({Key? key}) : super(key: key);
  TextEditingController serverController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mediAppBar("Server Config"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Server Config",
                style: mediHeadlineStyle,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: serverController,
                decoration: InputDecoration(
                  labelText: "Server Url",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                onPressed: () {
                  baseUrl = serverController.text;
                  Get.back();
                },
                child: Text(
                  "Save",
                  style: mediButtonStyle,
                ),
                color: kcmain,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Or",
                style: mediHeading1Style,
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                height: 50,
                minWidth: MediaQuery.of(context).size.width / 2,
                onPressed: () {
                  baseUrl = "http://localhost:8080/";
                  Get.back();
                },
                child: Text(
                  "Local Server",
                  style: mediButtonStyle,
                ),
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
