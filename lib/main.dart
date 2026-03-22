import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/blocProviders.dart';
import 'package:untitled/src/presentation/pages/login/LoginPage.dart';

import 'package:untitled/src/presentation/pages/register/RgisterPage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login':(BuildContext context)=>LoginPage(),
          'register':(BuildContext context)=> RegisterPage()
        },

      ),
    );
  }
}

