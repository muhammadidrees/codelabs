import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget{
  
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () { 
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
              barrierColor: Colors.black.withOpacity(0.4),
              transitionDuration: const Duration(seconds: 1),
              pageBuilder: (BuildContext context,
                Animation animation,
                Animation secondaryAnimation) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.blue,
                  );
                },
              transitionBuilder: (context, animation, secondaryAnimation, child) {
                
                final curvedValue = Curves.easeInOutBack.transform(animation.value) - 1.0;
                
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Transform(
                    transform: Matrix4.translationValues(curvedValue * - 280, curvedValue * 200, 0.0),
                    child: Transform.rotate(
                      angle: math.radians(curvedValue * 90),
                      child: AlertDialog(
                        title: Text("Hello"),
                        content: Text("Dil dil Pakistan"),
                      ),
                    ),
                  ),
                );
              }
            );
          }, 
          child: Text("Show Dialog"),
        ),
      ),
    );
  }
}