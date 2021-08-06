import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodlogin/food.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodlogin/register.dart';
//import 'package:sizes/sizes_helpers.dart';
import 'package:sized_context/sized_context.dart';
import 'package:foodlogin/forgotpwd.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FudLog());
}

class FudLog extends StatelessWidget {
  const FudLog({Key? key}) : super(key: key);
  //final String title = 'Sign In & Out';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {"/Logout": (context) => FudLog()},
      home: LoginPage(),
    );
  }
}

/*class AuthTypeSelector extends StatelessWidget {
  // Navigates to a new page
  void food(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }*/

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
/*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }*/

class _LoginPageState extends State<LoginPage> {
  final TextEditingController uname = TextEditingController();
  final TextEditingController pwd = TextEditingController();
  bool uerror = false;
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFFDF911C), const Color(0xADEE0000)],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //const SizedBox(width: 10.0, height: 120.0),
                      Text(
                        "It's ",
                        style: TextStyle(
                            fontSize: 43.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 64,
                        width: 72,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: DefaultTextStyle(
                            softWrap: false,
                            style: const TextStyle(
                              fontSize: 40.0,
                              fontFamily: 'Horizon',
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              // isRepeatingAnimation: true,
                              animatedTexts: [
                                RotateAnimatedText('miam!'),
                                RotateAnimatedText('miam!'),
                                RotateAnimatedText('miam!'),
                              ],
                              onTap: () {
                                print("Tap Event");
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 20)),
                        Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/foodicon.png?alt=media&token=304a18d6-448c-4560-9d4b-05d8b1745c5b",
                          height: 55,
                          width: 50,
                        ),
                        ListTile(
                          title: Text(
                            "Login to miam!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.orange[900],
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            children: [
                              SizedBox(height: 20),
                              TextFormField(
                                validator: (String? val) {
                                  return (val != null && val != '@')
                                      ? 'Enter a valid email'
                                      : null;
                                },
                                controller: uname,
                                style: TextStyle(color: Colors.orange[900]),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.orange[900],
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.orange)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Enter Email",
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              if (uerror)
                                Text("Please enter valid email",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                    )),
                              SizedBox(height: 15),
                              TextFormField(
                                controller: pwd,
                                obscureText: flag,
                                style: TextStyle(color: Colors.orange[900]),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.orange[900],
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        flag = !flag;
                                      });
                                    },
                                    icon: Icon(
                                        (!flag)
                                            ? Icons.visibility_off
                                            : Icons.remove_red_eye,
                                        color: Colors.black),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.orange)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Enter password",
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              //SizedBox(height: 1),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    print('Forgot Password');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                ForgotPwd()));
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              TextButton(
                                /*onPressed: (){
                                            print("login");
                                            Navigator.push(
                                                   context,
                                                   MaterialPageRoute(
                                                     builder: (BuildContext context) => Food(
                                                       //vari: uname.text,
                                                       //varr: pwd.text,
                                                     ),
                                                     ),
                                             );
                                              },*/

                                onPressed: () async {
                                  if (uname.text.length < 6) {
                                    setState(() {
                                      uerror = true;
                                    });
                                    return null;
                                  }
                                  setState(() {
                                    uerror = false;
                                  });
                                  await _signInWithEmailAndPassword();
                                },
                                child: Text('Login'),
                                style: TextButton.styleFrom(
                                  alignment: AlignmentDirectional.center,
                                  backgroundColor: Colors.orange[900],
                                  primary: Colors.black,
                                ),
                              ),
                              SizedBox(height: 0),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: TextButton(
                                  onPressed: () {
                                    print('Register');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomePage(
                                                //vari: uname.text,
                                                //varr: pwd.text,
                                                ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Don't Have An Account? Register Now",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

  Future<void> _signInWithEmailAndPassword() async {
    try {
      // print(uname.text);
      // print(pwd.text);
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: uname.text,
        password: pwd.text,
      ))
          .user;
      // print(user);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Food(),
          ));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to sign in with Email & Password'),
        ),
      );
    }
  }
}
