import 'package:flutter/material.dart';
import 'package:reservation_medical_app/models/doctor.dart';



class ContactButtons extends StatelessWidget {
  final Doctor doctor;
  const ContactButtons({
    Key? key,required this.doctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {},
            color: Colors.white,
            height: 50,
            minWidth: 50,
            child: Icon(Icons.call_outlined),
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {},
            color: Colors.white,
            height: 50,
            minWidth: 50,
            child: Icon(Icons.mail_outline),
          ),
        ],
      ),
    );
  }
}
