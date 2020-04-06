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
        // primarySwatch: Colors.blue,
        primaryColor: Color(0xFFFCF102),
        accentColor: Color(0xFF246AB3),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget{
  
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool showButton = true;

  /// To be usead as a callback function
  void setShowButton(bool value){
    setState(() {
      showButton = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Align(
          alignment: Alignment.topRight,
          child: RotatedBox(
            quarterTurns: 3,
            child: SummaryButton(
              child: Text("Summary"),
              showButton: showButton,
              onTap: () { 
                setShowButton(false);
                showSummaryDialog(context);
              }, 
            ),
          ),
        ),
      ),
    );
  }

  Future showSummaryDialog(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.4),
      transitionDuration: const Duration(seconds: 1),
      pageBuilder: (BuildContext context,
        Animation animation,
        Animation secondaryAnimation) {
          return Container();
        },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        
        final curvedValue = Curves.easeInOutBack.transform(animation.value) - 1.0;

        // When animation is completed make button visible
        animation.addStatusListener((status) {
          if (status == AnimationStatus.dismissed)
            setShowButton(true);
        });
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Transform(
            transform: Matrix4.translationValues(curvedValue * - 280, curvedValue * 100, 0.0),
            child: Transform.rotate(
              angle: math.radians(curvedValue * 120),
              child: SummaryDialogBox(),
            ),
          ),
        );
      }
    );
  }
}

class SummaryDialogBox extends StatelessWidget {
  const SummaryDialogBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SummaryButton(child: Text("Summary")),
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ValueText(
                        label: "Total Registered For Ration",
                        value: "123456789",
                      ),
                      Container(
                        color: Colors.blue,
                        height: 30.0,
                        width: 1.0,
                      ),
                      ValueText(
                        label: "Total Ration Delivered",
                        value: "123456789",
                      ),
                    ],
                  ),

                  SizedBox(height: 16.0),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Date: 2 April 2020",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 10.0,
                        ),
                      ),
                      Text(
                        "Karachi Relief Trust",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                  
                  Container(
                    color: Colors.blue,
                    height: 1.0,
                    width: MediaQuery.of(context).size.width,
                  ),
                  
                  SizedBox(height: 16.0),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ValueText(
                        label: "Registered For Ration",
                        value: "123456789",
                        valueFontSize: 16.0,
                      ),
                      ValueText(
                        label: "Ration Delivered",
                        value: "1234",
                        valueFontSize: 16.0,
                      ),
                      ValueText(
                        label: "Pending Ration",
                        value: "123456789",
                        valueFontSize: 16.0,
                      ),
                    ],
                  ),

                  SizedBox(height: 16.0,),

                  Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("CLOSE"),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ValueText extends StatelessWidget {

  final String label, value;
  final double valueFontSize; 

  const ValueText({
    Key key, this.label, this.value, this.valueFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontSize: 8.0,
              color: Colors.black45,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: valueFontSize?? 20.0,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryButton extends StatelessWidget {
  final Function onTap;
  final Widget child;
  final Color buttonColor;

  /// if set to true the button will be displayed else it will show
  /// an empty container. By default it is set to true
  final bool showButton;
  
  const SummaryButton({
    Key key, this.onTap, @required this.child, this.buttonColor, bool showButton,
  }): this.showButton = showButton?? true,
      super(key: key);

  @override
  Widget build(BuildContext context) {

    // radius of top corners of button
    const BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(12.0),
      topRight: Radius.circular(12.0),
    );
    
    return (showButton?? true)? GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 5,
        borderRadius: borderRadius,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: buttonColor?? Theme.of(context).primaryColor,
            borderRadius: borderRadius,
          ),
          child: child,
        ),
      ),
    ) : Container();
  }
}