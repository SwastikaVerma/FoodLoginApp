import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodlogin/main.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class ForgotPwd extends StatefulWidget {
  ForgotPwd({Key? key}) : super(key: key);

  @override
  _ForgotPwdState createState() => _ForgotPwdState();
}

class _ForgotPwdState extends State<ForgotPwd> {
  String? _email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
       child: Scaffold(
         resizeToAvoidBottomInset: false,
         backgroundColor: Colors.white,
         appBar: AppBar(
           backgroundColor: Colors.orange,
           centerTitle: true,
           title: Text("miam!",
           textAlign: TextAlign.center,
           style: TextStyle(
             color: Colors.black,
             fontWeight: FontWeight.bold,
              fontSize: 24,
           ),
           ),
         ),
         body: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                          Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/foodlogin-5015f.appspot.com/o/foodicon.png?alt=media&token=304a18d6-448c-4560-9d4b-05d8b1745c5b",
                            height: 55,
                            width: 50,
                ),
                ListTile(
                  title: Text("Welcome to miam!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.orange[900],
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                  ),
                ), 
                TextField(
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
                                  onChanged: (value){
                                    setState((){
                                      _email = value;
                                    }
                                    );
                                  },
                ) ,
                SizedBox(height: 25),
                TextButton(
                  onPressed: () async{
                    print('Reset password');
                    await _auth.sendPasswordResetEmail(email: _email!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Reset Password",
                   ),
                   style: TextButton.styleFrom(
                      alignment: AlignmentDirectional.center,
                      backgroundColor: Colors.orange[900],
                      primary: Colors.black,
                
                  ),
                ),
              ],
            ),
         ),
       ),
    );
  }
}