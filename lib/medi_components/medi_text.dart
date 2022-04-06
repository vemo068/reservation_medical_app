import 'package:flutter/material.dart';

import '../Styles/medi_colors.dart';
import '../Styles/medi_styles.dart';


class MediText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const MediText.headingOne(this.text) : style = mediHeading1Style;
  const MediText.headingTwo(this.text) : style = mediHeading2Style;
  const MediText.headingThree(this.text) : style = mediHeading3Style;
  const MediText.headline(this.text) : style = mediHeadlineStyle;
  const MediText.subHeading(this.text) : style = mediSubheadingStyle;

  const MediText.caption(this.text) : style = mediCaptionStyle;

  MediText.body(this.text, {Color color = Colors.grey})
      : style = mediBodyStyle.copyWith(color: color);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
