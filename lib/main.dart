// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grad_proj/Domain/user_provider.dart';
import 'package:grad_proj/Pages/pagesUser/reqCategory.dart';
import 'package:grad_proj/Pages/pagesWorker/workerRequest.dart';
import 'package:grad_proj/Pages/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

// Color(0xFFBBA2BF)
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
   
  }
}
