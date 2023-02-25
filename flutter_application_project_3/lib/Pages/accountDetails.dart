import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/Pages/NavBar.dart';
import 'package:flutter_application_project_3/moduls/UserC.dart';
import 'package:flutter_application_project_3/moduls/appStyle.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key, required this.email, required this.password});
  final String email;
  final String password;
  @override
  State<AccountDetails> createState() => _AccountDetails();
}

class _AccountDetails extends State<AccountDetails> {
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final bool _onEditing = true;
  String? _code;

  @override
  void dispose() {
    numberController.dispose();
    emailController.dispose();
    fNameController.dispose();
    lNameController.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account details'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                UserC user = UserC(
                  id: numberController.text,
                  firstName: fNameController.text,
                  lastName: lNameController.text,
                  email: widget.email,
                  password: widget.password,
                  phone: numberController.text,
                  wallet: '50',
                  orders: [],
                  favorites: [],
                );
                final userCollection = FirebaseFirestore.instance.collection('user');
                final userDoc = userCollection.doc(widget.email);
                userDoc.set(user.toMap());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NavBar(
                              currentIndex: 0,
                              secondePage: 0,
                              restaurantId: 0,
                            )));
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
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
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Phone'),
                onChanged: (val) {},

                controller: numberController,

                onSaved: (value) {},
                // textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: AppStyle.spasingHight,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(labelText: 'First Name'),
                onChanged: (val) {},

                controller: fNameController,

                onSaved: (value) {},
                // textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: AppStyle.spasingHight,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(labelText: 'Last Name'),
                onChanged: (val) {},

                controller: lNameController,

                onSaved: (value) {},
                // textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: AppStyle.spasingHight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gender',
                    style: TextStyle(fontSize: AppStyle.textNormalSize),
                  ),
                  ToggleSwitch(
                      totalSwitches: 2,
                      labels: const ['Male', 'Female'],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                      cornerRadius: 20.0,
                      initialLabelIndex: 1,
                      minWidth: 90.0,
                      activeBgColors: const [
                        [Colors.blue],
                        [Colors.pink]
                      ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
