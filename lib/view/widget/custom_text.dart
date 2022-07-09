part of '../landing_page.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {Key? key,
      this.type = 'heading',
      required this.customStyles,
      this.fontSize = 10})
      : super(key: key);

  final String type;
  final double fontSize;
  final dynamic customStyles;
  @override
  Widget build(BuildContext context) {
    return Text(
      customStyles[type]?.text,
      style: TextStyle(
        color: Color(customStyles[type]?.color),
        fontSize: fontSize.sp / 1.5,
        fontFamily: customStyles[type]?.fontFamily,
        fontWeight: customStyles[type]?.fontWeight,
      ),
    );
  }
}
