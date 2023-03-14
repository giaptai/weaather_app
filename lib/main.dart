import 'package:flutter/material.dart';
import 'package:weaather_app/utilities/colofull.dart';
import 'package:weaather_app/widget/home_screen.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colorfull.lightBlue,
        ),
        // textTheme: GoogleFonts.poppinsTextTheme(
        //   Theme.of(context).textTheme,
        // ),
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
