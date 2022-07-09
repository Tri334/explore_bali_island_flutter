import 'package:bloc/bloc.dart';
import 'package:explore_bali_island_flutter/observer.dart';
import 'package:explore_bali_island_flutter/view/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()), blocObserver: Observer());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        home: LandingPage(),
      );
    });
  }
}
