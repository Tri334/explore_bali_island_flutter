part of '../view/landing_page.dart';

class MainStyle {
  String fontFamily;

  MainStyle({this.fontFamily = 'Nunito'});
}

class ChildStyle extends MainStyle {
  int color;
  String text;
  FontWeight fontWeight;

  ChildStyle(
      {required this.text, required this.color, required this.fontWeight});
}

class MainButton {
  double height, width;
  int color;

  MainButton({required this.color, required this.height, required this.width});
}

var childStyles = {
  'heading': ChildStyle(
      text: 'Explore Bali Island Now',
      color: 0xffFAFAFA,
      fontWeight: FontWeight.w500),
  'headingDsc': ChildStyle(
      text: 'Bali has a variety of unique places, traditions and many more!',
      color: 0xffD6D6D6,
      fontWeight: FontWeight.normal),
  'headingButton': ChildStyle(
      text: 'Explore Now', color: 0xff1D1D1D, fontWeight: FontWeight.w700),
  'headingIconText': ChildStyle(
      text: 'Kelingking Beach', color: 0xffFAFAFA, fontWeight: FontWeight.bold),
  'buttonLanding': MainButton(color: 0xffA5BE00, height: 54, width: 152)
};

customText({required childStyles, required String type}) {
  return Text(
    childStyles[type]?.text,
    style: TextStyle(
      color: Color(childStyles[type]?.color),
      fontFamily: childStyles[type]?.fontFamily,
      fontWeight: childStyles[type]?.fontWeight,
    ),
  );
}
