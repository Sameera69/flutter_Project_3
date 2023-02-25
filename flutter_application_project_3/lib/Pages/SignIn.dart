import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/Pages/accountDetails.dart';
import 'package:flutter_application_project_3/moduls/Cart.dart';
import 'package:flutter_application_project_3/moduls/UserC.dart';
import 'package:flutter_application_project_3/moduls/appStyle.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    numberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(AppStyle.leftRightPadding, 0, AppStyle.leftRightPadding, 0),
          child: Column(
            children: [
              SizedBox(
                height: AppStyle.spasingHight,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: (val) {},

                controller: emailController,

                onSaved: (value) {},
                // textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: AppStyle.spasingHight,
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(labelText: 'Password'),
                onChanged: (val) {},

                controller: passwordController,

                onSaved: (value) {},
                // textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: AppStyle.spasingHight,
              ),
              InkWell(
                onTap: () async {
                  try {
                    final ruselt = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AccountDetails(email: emailController.text, password: passwordController.text)));
                  } catch (error) {
                    final ruselt = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                  }
                  setState(() {});
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    border: Border.fromBorderSide(BorderSide(color: Colors.transparent)),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  width: AppStyle.bottonWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text('Sign In', style: TextStyle(color: Colors.white, fontSize: AppStyle.bottonTextSize)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
