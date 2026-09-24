import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siply/pages/intro_page.dart';
import 'package:siply/providers/smoothie_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SmoothieProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: IntroPage());
  }
}
