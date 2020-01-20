import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:template1/variables/global.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

//Colors
  Color bgColor = Colors.white;
  Color btnColor = Colors.blue;
  Color btnText = Colors.white;

//Logo
  String _logo = "assets/qonvex_logo.png";

//condition
  bool isKeyboardWorking = false;
  bool isLoading = false;
  bool isObscured = true;

  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();

//API Here
  _login() async{
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isLoading = false;
  });
  }

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
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return OrientationBuilder(
      builder: (context, orientation){
        if(orientation == Orientation.portrait){
          // PORTRAIT DESIGN
          return Container(
            color: bgColor,
            width: scrW,
            height: scrH,
            child: Column(
              children: <Widget>[
                SafeArea(
                  child: isKeyboardWorking ? Container():Container(
                  width: scrW,
                  height: scrH/5,
                  child: Image(
                    image: AssetImage(_logo),
                    fit: BoxFit.fitHeight,
                  ),
 
                ),
                ),
                Expanded(
                  child: Container(
         
                    padding: EdgeInsets.symmetric(horizontal: scrW/15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                   width: scrW,
                   child: TextField(
                     controller: _username,
                     decoration: InputDecoration(
                       suffixIcon: IconButton(
                         onPressed: (){
                           _username.clear();
                         },
                         icon: Icon(Icons.cancel),
                       ),
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                   ),

                 ),
                 SizedBox(height: 20,),
                        Container(
                   width: scrW,
                   child: TextField(
                     controller: _password,
                     obscureText: isObscured,
                     decoration: InputDecoration(
                       suffixIcon: IconButton(
                         onPressed: (){
                           setState(() {
                             isObscured = !isObscured;
                           });
                         },
                         icon: Icon( isObscured ? Icons.visibility : Icons.visibility_off),
                       ),
                       border: OutlineInputBorder(),
                       labelText: 'Mot de passe'
                     ),
                   ),
                 ),
                SizedBox(height: 10,),
                 GestureDetector(
                   child: Container(
                     alignment: Alignment.centerRight,
                     width: scrW,
                     height: scrH/30,
                     child: Text("Mot de passe oublie?"),
                   ),
                 ),

                Expanded(
                   child: Container(
                     child: Column(
                       children: <Widget>[
                         GestureDetector(
                           onTap: (){
                             _login();
                           },
                           child: Container(
                             decoration: BoxDecoration(
                               color: btnColor,
                               borderRadius: BorderRadius.circular(5)
                             ),
                             width: scrW,
                             height: scrH/20,
                         
                             child: Center(child: Text("Login" ,style: TextStyle(color: btnText, fontSize: 15),)),
                           ),
                         )
                       ],
                     ),
                   ),
                 ),

                 Container(
                    width: scrW,
                    height: scrH/15,
                    
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            child: Container(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text("Privacy Policy"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            child: Container(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text("Contact Us"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                      ],

                    ),
                  ),
                )
              ],
            ),
          );
        }else{
          // LANDSCAPE DESIGN
          return Container(
            color: bgColor,
            width: scrW,
            height: scrH,
            child: Column(
              children: <Widget>[
                SafeArea(
                  child: isKeyboardWorking ? Container():Container(
                  width: scrW,
                  height: scrH/5,
                  child: Image(
                    image: AssetImage(_logo),
                    fit: BoxFit.fitHeight,
                  ),
 
                ),
                ),
                Expanded(
                  child: Container(
         
                    padding: EdgeInsets.symmetric(horizontal: scrW/15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                   width: scrW,
                   child: TextField(
                     controller: _username,
                     decoration: InputDecoration(
                       suffixIcon: IconButton(
                         onPressed: (){
                           _username.clear();
                         },
                         icon: Icon(Icons.cancel),
                       ),
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                   ),

                 ),
                 SizedBox(height: 20,),
                        Container(
                   width: scrW,
                   child: TextField(
                     controller: _password,
                     obscureText: isObscured,
                     decoration: InputDecoration(
                       suffixIcon: IconButton(
                         onPressed: (){
                           setState(() {
                             isObscured = !isObscured;
                           });
                         },
                         icon: Icon( isObscured ? Icons.visibility : Icons.visibility_off),
                       ),
                       border: OutlineInputBorder(),
                       labelText: 'Mot de passe'
                     ),
                   ),
                 ),
                SizedBox(height: 10,),
                 GestureDetector(
                   child: Container(
                     alignment: Alignment.centerRight,
                     width: scrW,
                     height: scrH/30,
                     child: Text("Mot de passe oublie?"),
                   ),
                 ),
                SizedBox(height: 10,),
                
                isKeyboardWorking ? Container(): Expanded(
                   child: Container(
                     child: Column(
                       children: <Widget>[
                         GestureDetector(
                           onTap: (){
                             _login();
                           },
                           child:Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(5),
                               color: btnColor,
                             ),
                             width: scrW,
                             height: scrW/20,
                             
                             child: Center(child: Text("Login" ,style: TextStyle(color: btnText, fontSize: 15),)),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),

                 isKeyboardWorking ? Container(): Container(
                    width: scrW,
                    height: scrH/5,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            child: Container(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text("Privacy Policy"),
                            ),
                          ),
                        ),
                       
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            child: Container(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text("Contact Us"),
                            ),
                          ),
                        ),
                        SizedBox(height: scrH/20,)
                      ],
                    ),
                  ),

                      ],

                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}