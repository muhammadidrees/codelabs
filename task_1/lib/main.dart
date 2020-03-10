import 'package:flutter/material.dart';
import 'package:task_1/constants.dart';
import 'package:task_1/ui/complain_history/coomplain_history_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF8460AA),
        accentColor: Color(0xFFC8C9CB),
        scaffoldBackgroundColor: Color(0xFFE7E7E9),
        iconTheme: IconThemeData(
          color: Color(0xFFEBE5EC),
          size: app_icon_size,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
        ),

        textTheme: TextTheme(

          // used for list headers
          headline1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF5B5B5D),
          ),

          // used for list title
          headline2: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFFEBE5EC),
          ),

          // used for statuses
          headline3: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w500,
            color: Color(0xFFEBE5EC),
          ),

          bodyText1: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),

          bodyText2: TextStyle(
            fontSize: 6.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      home: ComplainHistoryScreen(title: 'OptiX'),
    );
  }
}