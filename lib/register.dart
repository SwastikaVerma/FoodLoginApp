import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodlogin/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, pwd}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final name = TextEditingController();
  final uname = TextEditingController();
  final pwd = TextEditingController();

  bool _success = false;
  String _userEmail = '';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xD7FD5624),
          centerTitle: true,
          title: Text(
            "SIGN UP",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        body: Center(
          child: Card(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                ListTile(
                  title: Text(
                    "Welcome to miam!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.orange[900],
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      TextField(
                        style: TextStyle(color: Colors.orange[900]),
                        controller: name,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.account_circle_rounded,
                            color: Colors.orange[900],
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                            ),
                          ),
                          labelText: "NAME",
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      TextFormField(
                        validator: (String? val) {
                          return (val != null && val != '@')
                              ? 'Enter a valid email'
                              : null;
                        },
                        style: TextStyle(color: Colors.orange[900]),
                        controller: uname,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.mail_outline_sharp,
                              color: Colors.orange[900]),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          labelText: "EMAIL",
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      TextField(
                        style: TextStyle(color: Colors.orange[900]),
                        obscureText: true,
                        controller: pwd,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock_sharp,
                            color: Colors.orange[900],
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      TextField(
                        style: TextStyle(color: Colors.orange[900]),
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.check,
                            color: Colors.orange[900],
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        onPressed: () async {
                          await homePage();
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => FudLog(),
                            ),
                          );
                        },
                        child: Text('REGISTER'),
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.all(16),
                            alignment: AlignmentDirectional.center,
                            backgroundColor: Colors.orange[900],
                            primary: Colors.black),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          onPressed: () {
                            //print('Register');
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Already Have An Account?',
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
        ),
      ),
    );
  }

  Future<void> homePage() async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final User? user = (await _auth.createUserWithEmailAndPassword(
        email: uname.text,
        password: pwd.text,
      ))
          .user;
      FirebaseFirestore.instance.collection('register').doc(user!.email).set({
        //'id': user.uid,
        'name': name.text,
        'email': user.email,
      });
      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email!;
        });
      } else {
        _success = false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("Password is too weak");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Weak password'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        print('This account already exist');
      }
    } catch (e) {
      print(e);
    }
  }
}
