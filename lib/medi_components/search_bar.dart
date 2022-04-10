import 'package:flutter/material.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';


class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: 45,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: kcwhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const TextField(
        decoration: InputDecoration(
            hintText: 'enter doctor name',
            suffixIcon: Icon(
              Icons.search,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
