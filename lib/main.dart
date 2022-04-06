import 'package:flutter/material.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';

import 'models/speciality.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: const NewD(),
          backgroundColor: kcbackground,
          body: Column(
            children: const [
              CustomAppBar(),
              Center(child: Text("Welcome", style: mediHeading3Style)),
              Center(child: Text("Choose a Doctor", style: mediHeading3Style)),
            ],
          )),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: 45,
      width: 180,
      decoration: BoxDecoration(
        color: kcwhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const TextField(
        decoration: InputDecoration(
            hintText: 'enter doctor name',
            prefixIcon: Icon(
              Icons.search,
            ),
            border: InputBorder.none),
      ),
    );
  }
}

class NewD extends StatelessWidget {
  const NewD({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Drawer();
  }
}

class SpecialityCard extends StatelessWidget {
  final Specility speciality;
  const SpecialityCard({
    Key? key,
    required this.speciality,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kcmain.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(
        speciality.img,
        fit: BoxFit.cover,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          child: const Center(
            child: Text(
              "Home",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          color: kcmain,
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
        ),

        Container(), // Required some widget in between to float AppBar

        const Positioned(
          // To take AppBar Size only
          top: 80.0,
          left: 10.0,
          right: 10.0,
          child: SearchBar(),
          // child: AppBar(
          //   foregroundColor: kcmain,
          //   backgroundColor: Colors.white,
          //   leading: const Icon(Icons.menu),
          //   primary: false,
          //   title: const TextField(
          //       decoration: InputDecoration(
          //           hintText: "Search",
          //           border: InputBorder.none,
          //           hintStyle: TextStyle(color: Colors.grey))),
          //   actions: <Widget>[
          //     IconButton(
          //       icon: const Icon(Icons.search, color: kcmain),
          //       onPressed: () {},
          //     )
          //   ],
          // ),
        )
      ],
    );
  }
}
