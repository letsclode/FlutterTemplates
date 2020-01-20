import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:template1/variables/global.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


//Settings
  Color btnColor = Colors.blue;
  Color btnText = Colors.white;


  bool isKeyboardWorking = false;
  bool isLoading = false;

  void initState() {
  super.initState();

  KeyboardVisibilityNotification().addNewListener(
    onChange: (bool visible) {
      setState(() {
        isKeyboardWorking = visible;
      });
    },
  );
}
_login() async{
  setState(() {
     isLoading = true;
  });
  await Future.delayed(Duration(seconds: 3));
  setState(() {
     isLoading = false;
 });
}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return OrientationBuilder(
      builder: (context, orientation){
        if(orientation == Orientation.portrait){
          return Container(
            width: scrW,
            height: scrH,
            child: Column(
              children: <Widget>[
                isKeyboardWorking ? Container():Container(
                  width: scrW,
                  height: scrH/10,
                  color: Colors.red,
                )
              ],
            ),
          );
        }
      },
    );
  }
}