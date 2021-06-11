import 'package:cloud_firestore/cloud_firestore.dart';
import "package:dostapp/loader.dart";
import 'package:dostapp/sample.dart';
import 'package:flutter/material.dart';
import 'package:dostapp/main.dart';
import 'dashboard.dart';
import 'sample.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:connectivity/connectivity.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
@override
_LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
QuerySnapshot data;
bool _isHidden=true;
final auth=FirebaseAuth.instance;
String _email, _password,_name,
    _rollNo,
    _section,
    _retypepass,
    _department,
    _contact,
    _pastExperience;
bool flag=false,loginClicked=true;
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
_facebookUrl() async {
  const url = "https://www.facebook.com/uitcs.acm/?epa=SEARCH_BOX";
  var results = await Connectivity().checkConnectivity();
  if (results == ConnectivityResult.none) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Connectivity Issue!"),
            content: Text("No Internet"),
            actions: <Widget>[
              TextButton(
                child: Text("Try Again!"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }
  else {
    if (await canLaunch(url)) {
      await launch(url);
    }
    else {
      throw "Could not launch";
    }
  }
}
_instaUrl() async{
  const url="https://instagram.com/uitcs.acm?igshid=zhiflpb7sali";
  var results = await Connectivity().checkConnectivity();
  if (results == ConnectivityResult.none) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Connectivity Issue!"),
            content: Text("No Internet"),
            actions: <Widget>[
              TextButton(
                child: Text("Try Again!"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }
  else {
    if (await canLaunch(url)) {
      await launch(url);
    }
    else {
      throw "Could not launch";
    }
  }
}
_webUrl() async {
  const url = "http://uitcs.acm.org/";
  var results = await Connectivity().checkConnectivity();
  if (results == ConnectivityResult.none) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Connectivity Issue!"),
            content: Text("No Internet"),
            actions: <Widget>[
              TextButton(
                child: Text("Try Again!"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }
  else {
    if (await canLaunch(url)) {
      await launch(url);
    }
    else {
      throw "Could not launch";
    }
  }
}
@override
void initState() {
  // TODO: implement initState
  super.initState();
  print("init state");
}
void _togglePasswordView(){
  setState(() {
    _isHidden=!_isHidden;
  });
}
@override
Widget build(BuildContext context) {
  return WillPopScope(
    onWillPop: _onBackPressed,
    child: Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height/10),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/12,
                  child: FittedBox(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          //fontSize: 45,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/27,
                  child: FittedBox(
                    child: Text(
                      "TO CONTINUE",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:60),
              Padding(
                padding: const EdgeInsets.only(right:13,left:10),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (input) {
                    if (input.contains("@")) {
                      return null;
                    } else {
                      return "Invalid Email format";
                    }
                  },
                  onSaved: (input) => _email = input,
                  //onChanged: (input) => _email = input.trim(),
                  decoration: InputDecoration(
                     //isDense: true,
                    // contentPadding: EdgeInsets.all(8),
                    labelText: "Username",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    hintText: "abc@gmail.com",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:15),
              Padding(
                padding: const EdgeInsets.only(right:13,left:10),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (input) {
                    if (input.length < 6) {
                      print("Your password must have at least 6 characters");
                      return "Your password must have at least 6 characters";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (input) => _password = input,
                  //onChanged: (input) => _password = input.trim(),
                  obscureText: _isHidden,
                  decoration: InputDecoration(
                     isDense: true,
                    //suffix: _isHidden? Icon(Icons.visibility,color: Colors.purple,size: 18):Icon(Icons.visibility_off,color: Colors.purple,size: 18),
                    suffixIcon: InkWell(
                      child: _isHidden? Icon(Icons.visibility,color: Colors.purple,size: 18):Icon(Icons.visibility_off,color: Colors.purple,size: 18),
                      onTap: _togglePasswordView,
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    hintText: "6 characters at least",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(right:13,left:10),
                child: ElevatedButton(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: <Widget>[
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          Center(
                            child: Text(
                              "LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    /*RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),*/
                    /*MaterialStateProperty.all<RoundedRectangleBorder>(

                    ),*/
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      primary: Colors.purple,
                      onPrimary: Colors.pink,
                      minimumSize: Size(MediaQuery.of(context).size.width/2,50)
                  ),
                  onPressed: () {
                    print("Pressed");
                    signIn();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()),);
                  },
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Dashboard()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black87, fontSize: 17),
                    ),
                    Text(
                      " Register",
                      style: TextStyle(color: Colors.blue.shade700, fontSize: 17),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: flag,
                child: Column(
                  children: <Widget>[
                    Loader(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Contact us at: ",style: TextStyle(color: Colors.black87),),
                    SizedBox(width:6),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 20,
                      child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.facebookF,
                          color: Colors.white,
                        ),
                        onPressed: _facebookUrl,
                      ),
                    ),
                    SizedBox(width:6),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 20,
                      child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.instagram,
                          color: Colors.white,
                        ),
                        onPressed: _instaUrl,
                      ),
                    ),
                    SizedBox(width:6),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 20,
                      child: IconButton(
                        icon: Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        onPressed: _webUrl,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
Future signIn() async {
  //FirebaseUser user;
  //AuthResult result;
  final formState = _formkey.currentState;
  var results=await Connectivity().checkConnectivity();
  if (formState.validate()) {
    formState.save();
    if(results==ConnectivityResult.none){
      print("Connectivity None");
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Connectivity Issue!"),
              content: Text("No Internet"),
              actions: <Widget>[
                TextButton(
                  child: Text("Try Again!"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }
      );
    }
    else{
      setState(() {
        flag=true;
      });
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        // getData().then((results) {
        //   setState(() {
        //     if (results.documents.isNotEmpty) {
        //       data = results;
        //       _name=data.documents[0]['Name'];
        //       _rollNo=data.documents[0]['RollNo'];
        //       _section=data.documents[0]['Section'];
        //       print(_section);
        //       _password=data.documents[0]['Password'];
        //       _department=data.documents[0]['Department'];
        //       _contact=data.documents[0]['Contact'];
        //       _pastExperience=data.documents[0]['PastExperience'];
        //       print(_pastExperience);
        //       print("data=results");
        //       flag=false;
        //       Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => Home(_email,true,_name,_rollNo,_section,_password,_department,_contact,_pastExperience,)));
        //     }
        //     else{
        //       print("Documents are empty");
        //     }
        //   });
        // });
        print(userCredential);
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Page1()));
        //return user;
      }/*on FirebaseAuthException*/ catch (e) {
        setState(() {
          flag=false;
        });
        print("This is error: ${e.message}");
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error!"),
                //An internal error has occurred. [ 7: ]
                content: e.message == "The email address is badly formatted."
                    ? Text("Remove extra space(s) after your email")
                    :e.message=="An internal error has occurred. [ 7: ]"? Text("No Internet"): Text("Invalid email or password"),
                actions: <Widget>[
                  TextButton(
                    child: Text("Try Again!"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            }
        );
        print(e.message);
      }
    }
  } else {
    print("Form invalid");
  }
}

Future<bool> _onBackPressed() {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation!"),
          content: Text("Do you want to exit?"),
          actions: <Widget>[
            Row(
              children: <Widget>[
                TextButton(
                    child: Text("Yes"),
                    onPressed: () {
                      SystemNavigator.pop();
                    }
                ),
                TextButton(
                    child: Text("No"),
                    onPressed: () {
                      Navigator.pop(context,false);
                    }
                ),
              ],
            )
          ],
        );
      });
}
}
