import 'package:flutter/material.dart';
import 'package:reservation_medical_app/Styles/medi_colors.dart';
import 'package:reservation_medical_app/medi_components/mediappbar.dart';
import 'package:reservation_medical_app/models/speciality.dart';

class SpecialitiesPage extends StatelessWidget {
  const SpecialitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mediAppBar("All Specialities"),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 30, mainAxisSpacing: 30),
            itemCount: sps.length,
            itemBuilder: (context, index) {
              return Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  splashColor: kcsecondary,
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kcmain.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: AssetImage(sps[index].img))),
                            )),
                        Expanded(child: Text(sps[index].name))
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
