import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/medules/homeScreen/homeScreen.dart';
import 'package:todo_app/shared/components/componentes.dart';
import 'package:todo_app/shared/network/remote/firebase.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var signupemailcontroller = TextEditingController();
  var signupphonecontroller = TextEditingController();
  var signupnamecontroller = TextEditingController();
  var signuppasswordcontroller = TextEditingController();
  var signupaddresscontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isaccepted = true;
  bool isloding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        buildloginheader(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                defaulttextformfield(
                    validate: (value) {
                      if (value.toString().isEmpty) {
                        return 'please enter name';
                      }
                    },
                    label: "NAME",
                    controller: signupnamecontroller,
                    type: TextInputType.name),
                SizedBox(
                  height: 13,
                ),
                defaulttextformfield(
                    validate: (value) {
                      if (value.toString().isEmpty) {
                        return 'please enter phone number';
                      }
                    },
                    suffix: custumIcon(ontap: () {}),
                    label: "PHONE NUMBER",
                    controller: signupphonecontroller,
                    type: TextInputType.phone),
                SizedBox(
                  height: 13,
                ),
                defaulttextformfield(
                    validate: (value) {
                      if (value.toString().isEmpty) {
                        return 'please enter email';
                      }
                    },
                    suffix: custumIcon(ontap: () {}),
                    label: "EMAIL ADDRESS",
                    controller: signupemailcontroller,
                    type: TextInputType.emailAddress),
                SizedBox(
                  height: 13,
                ),
                defaulttextformfield(
                    validate: (value) {
                      if (value.toString().isEmpty) {
                        return 'please enter password';
                      }
                    },
                    isPassword: true,
                    suffix: custumIcon(ontap: () {}),
                    label: "PASSWORD",
                    controller: signuppasswordcontroller,
                    type: TextInputType.text),
                SizedBox(
                  height: 13,
                ),
                defaulttextformfield(
                    validate: (value) {
                      if (value.toString().isEmpty) {
                        return 'please enter address';
                      }
                    },
                    label: "ADDRESS",
                    controller: signupaddresscontroller,
                    type: TextInputType.text),
                SizedBox(
                  height: 13,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                  value: isaccepted,
                  onChanged: (value) {
                    setState(() {
                      isaccepted = !isaccepted;
                    });
                    print(value);
                  }),
              Text(
                "I have read and agree to the ",
                style: TextStyle(color: HexColor("#707070"), fontSize: 15),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Terms and conditions",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: HexColor("#1DB1F3"),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 40),
            child: builddefaultContainerbutton(
                text: "Sign Up",
                ontap: () {
                  if (formkey.currentState!.validate() && isaccepted == true) {
                    Authentication.createAccount(
                            signupnamecontroller.text,
                            signupemailcontroller.text,
                            signuppasswordcontroller.text)
                        .then((value) => print(value!.displayName));
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HomeScreen(us,)));
                  } else {
                    print("some field is empty");
                  }
                }))
      ],
    )));
  }
}
