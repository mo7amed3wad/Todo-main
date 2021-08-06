import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/medules/SignupScreen/signupScreen.dart';
import 'package:todo_app/medules/homeScreen/homeScreen.dart';
import 'package:todo_app/shared/components/componentes.dart';
import 'package:todo_app/shared/remote/firebase.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var loginemailcontroller = TextEditingController();

  var loginPasswordcontroller = TextEditingController();

  bool isloading = false;

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildloginheader(),
          //SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formkey,
              child: Column(children: [
                defaulttextformfield(
                    validate: (value) {
                      if (value.toString().isEmpty) {
                        return 'please enter email';
                      }
                    },
                    label: "EMAIL ADDRESS",
                    type: TextInputType.emailAddress,
                    controller: loginemailcontroller),
                SizedBox(
                  height: 40,
                ),
                defaulttextformfield(
                  validate: (value) {
                    if (value.toString().isEmpty) {
                      return 'please enter password';
                    }
                  },
                  label: "Password".toUpperCase(),
                  type: TextInputType.text,
                  controller: loginPasswordcontroller,
                  isPassword: true,
                  suffix: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      "Forgot Password",
                      style:
                          TextStyle(color: HexColor("#707070"), fontSize: 11),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont have an account ?",
                      style:
                          TextStyle(color: HexColor("#707070"), fontSize: 16),
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: HexColor("#1DB1F3"),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                SizedBox(height: 19),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        print("face");
                      },
                      child: Container(
                          height: 55,
                          width: 55,
                          child: Image(
                            image: AssetImage('assets/facebook.png'),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        User? user = await Authentication.signInWithGoogle(
                            context: context);
                        print(user!.photoURL.toString());
                        print(user.displayName.toString());
                        print(user.refreshToken.toString());

                        // ignore: unnecessary_null_comparison
                        if (user != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                user: user,
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                          height: 55,
                          width: 55,
                          child: Image(
                            //fit: BoxFit.fitHeight,
                            image: AssetImage('assets/gmail logo.png'),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 19),
                isloading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : builddefaultContainerbutton(
                        text: "Sign In",
                        ontap: () {
                          if (formkey.currentState!.validate()) {
                            setState(() {
                              isloading = true;
                            });
                            Authentication.logIn(loginemailcontroller.text,
                                    loginPasswordcontroller.text)
                                .then((user) {
                              if (user != null) {
                                setState(() {
                                  isloading = false;
                                  print("login succseess");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen(
                                                user: user,
                                              )));
                                  print("token:" + user.uid.toString());
                                  print("name:" + user.email.toString());
                                });
                              } else {
                                setState(() {
                                  isloading = false;
                                });
                                print("faild login ");
                              }
                            });
                          } else {
                            print("some field is empty");
                          }
                        })
              ]),
            ),
          )
        ],
      ),
    ));
  }
}
