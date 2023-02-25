import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/Pages/Verification.dart';
import 'package:flutter_application_project_3/moduls/appStyle.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EnterNumber extends StatefulWidget {
  const EnterNumber({super.key});

  @override
  State<EnterNumber> createState() => _EnterNumberState();
}

class _EnterNumberState extends State<EnterNumber> {
  final numberController = TextEditingController();
  String number = '';

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter ToYou'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(AppStyle.leftRightPadding, 0, AppStyle.leftRightPadding, 0),
        child: Column(
          children: [
            SizedBox(
              height: AppStyle.spasingHight,
            ),
            IntlPhoneField(
              initialCountryCode: 'SA',
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(borderSide: BorderSide()),
              ),
              onChanged: (phone) {
                number = phone.completeNumber;
                //print(phone.completeNumber);
              },
            ),
            SizedBox(
              height: AppStyle.bottomHight1,
            ),
            InkWell(
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Verification(
                              num: number,
                            )));
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
                    child: Text('Continue', style: TextStyle(color: Colors.white, fontSize: AppStyle.bottonTextSize)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppStyle.spasingHight,
            ),
            SizedBox(
              width: AppStyle.appWidth,
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'By rapping on Continue, you confirm that yo have read, understood, and agreed to our ',
                      style: TextStyle(color: Colors.grey, fontSize: AppStyle.textNormalSize),
                    ),
                    TextSpan(
                      text: 'Terms and conditions ',
                      style:
                          TextStyle(color: Colors.blue, fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'and ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: AppStyle.textNormalSize,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy policy',
                      style:
                          TextStyle(color: Colors.blue, fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
