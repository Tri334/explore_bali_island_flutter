import 'package:bloc/bloc.dart';
import 'package:explore_bali_island_flutter/observer.dart';
import 'package:explore_bali_island_flutter/view/home/bloc/api/service_api.dart';
import 'package:explore_bali_island_flutter/view/home/bloc/home_bloc.dart';
import 'package:explore_bali_island_flutter/view/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()), blocObserver: Observer());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(ApiService())..add(FetchDataEvent()),
      child: const MaterialApp(
        home: LandingPage(),
      ),
    );
  }
}
