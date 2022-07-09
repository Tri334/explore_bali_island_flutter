part of '../landing_page.dart';

class BlurBox extends StatelessWidget {
  const BlurBox(
      {Key? key,
      required this.height,
      required this.width,
      this.blur = 0.5,
      this.child = const Text(''),
      this.radius = 0})
      : super(key: key);

  final double height, width, radius, blur;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: const Color(0xffF0F0F0).withOpacity(0.4))),
      child: Stack(fit: StackFit.expand, children: [
        Blur(
          blur: blur,
          blurColor: const Color(0xff1D1D1D).withOpacity(0.3),
          borderRadius: BorderRadius.circular(radius),
          child: const Text(''),
        ),
        ...[child]
      ]),
    );
  }
}
