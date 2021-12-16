import 'package:flutter/material.dart';
import 'package:flutter_app/styles/material_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: materialMainTheme,
      debugShowCheckedModeBanner: false,
      home: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [Color(0xFF9261E2), Color(0xFF5977DC)],
          ),
        ),
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            'myparking',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 35,
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
