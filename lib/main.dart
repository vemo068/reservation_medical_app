import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_medical_app/Controllers/speciality_controller.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/Styles/medi_styles.dart';
import 'package:reservation_medical_app/medi_components/medi_card.dart';

import 'models/speciality.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final SpecialityController specialityController =
      Get.put(SpecialityController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kcmain,
            title: const Text("Home"),
          ),
          drawer: const NewD(),
          backgroundColor: kcbackground,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: Text("Welcome", style: mediHeading3Style)),
                const Center(
                    child: Text("Choose a Doctor", style: mediHeading3Style)),
                const SearchBar(),
                GetBuilder<SpecialityController>(
                    init: specialityController,
                    builder: (_) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: sps.length,
                              itemBuilder: ((context, index) {
                                return SpecialityCard(
                                  speciality: sps[index],
                                  tapped: (catId) {
                                    specialityController.currentSpeciality =
                                        sps[index];
                                    specialityController.update();
                                  },
                                  isSelected:
                                      specialityController.currentSpeciality ==
                                              sps[index]
                                          ? true
                                          : false,
                                );
                              }),
                            ),
                          ),
                          Text(
                            specialityController.currentSpeciality.name +
                                " doctors",
                            style: mediSubheadingStyle,
                          ),
                          
                        ],
                      );
                    }),
                    GetBuilder(
                      init: specialityController,
                      builder: (_) {
                        return Expanded(
                          child: SizedBox(
                                  
                                  width: double.infinity,
                                  child: ListView.builder(
                                    itemCount:
                                        specialityController.getDoctors().length,
                                    itemBuilder: (context, index) {
                                      return MediCard(
                                        doctor:
                                            specialityController.getDoctors()[index],
                                      );
                                    },
                                  ),
                                ),
                        );
                      }
                    )
              ],
            ),
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
  final Function(String) tapped;
  final bool isSelected;
  SpecialityCard({
    Key? key,
    required this.speciality,
    required this.tapped,
    required this.isSelected,
  }) : super(key: key);
  final SpecialityController specialityController =
      Get.find<SpecialityController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialityController>(
        init: specialityController,
        builder: (_) {
          return InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              tapped(speciality.name);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? kcmain : kcmain.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                speciality.img,
                fit: BoxFit.cover,
              ),
            ),
          );
        });
  }
}
