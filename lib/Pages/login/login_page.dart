import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Pages/login/login_form.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';
import 'package:reservation_medical_app/medi_components/mediappbar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
      appBar: mediAppBar("Login"),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login as..",
            style: mediHeading2Style,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginModeCard(
                value: "User",
                ctx: context,
              ),
              LoginModeCard(
                value: "Doctor",
                ctx: context,
              )
            ],
          ),
        ],
      )),
    );
  }
}

class LoginModeCard extends StatelessWidget {
  final String value;
  final BuildContext ctx;
  const LoginModeCard({Key? key, required this.ctx, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Get.to(() => LoginForm(value: value));
        },
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: MediaQuery.of(ctx).size.height * 0.25,
          width: MediaQuery.of(ctx).size.width * 0.4,
          child: Column(
            children: [
              Expanded(
                child: Icon(
                  Icons.person,
                  semanticLabel: value,
                  size: MediaQuery.of(context).size.height * 0.15,
                ),
                flex: 3,
              ),
              Expanded(
                child: Text(
                  "$value",
                  style: mediButtonStyle.copyWith(color: kcsecondary),
                ),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
