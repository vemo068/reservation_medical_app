import 'package:flutter/material.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';

class MediButton extends StatelessWidget {
  final BuildContext ctx;
  final Function onPressed;
  final String text;
  final Color color;
  const MediButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.color,
      required this.ctx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      height: 50,
      minWidth: MediaQuery.of(ctx).size.width * 0.8,
      elevation: 0,
      hoverElevation: 0,
      onPressed: () {
        onPressed();
      },
      color: color,
      child: Text(
        text,
        style: mediButtonStyle,
      ),
    );
  }
}
