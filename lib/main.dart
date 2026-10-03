import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siply/cubits/smoothie_cubit.dart';
import 'package:siply/pages/intro_page.dart';

void main() {
  runApp(
   BlocProvider(
    create: (context) => SmoothieCubit(),
    child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: IntroPage());
  }
}
