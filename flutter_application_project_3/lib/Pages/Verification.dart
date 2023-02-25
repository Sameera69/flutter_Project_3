import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/moduls/appStyle.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class Verification extends StatefulWidget {
  const Verification({super.key, required this.num});
  final String num;
  @override
  State<Verification> createState() => _Verification();
}

class _Verification extends State<Verification> {
  final numberController = TextEditingController();
  bool _onEditing = true;
  String? _code;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpCode = TextEditingController();

  OutlineInputBorder border = const OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 3.0));

  bool isLoading = false;

  String? verificationId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyPN();
  }

  void verifyPN() async {
    try {
      // final result = await FirebaseAuth.instance.signInWithPhoneNumber(numberController.text);
      await phoneSignIn(phoneNumber: widget.num);
    } catch (error) {
      print(error);
    }
  }

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
        title: const Text('Verification'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(AppStyle.leftRightPadding, 0, AppStyle.leftRightPadding, 0),
          child: Column(
            children: [
              SizedBox(
                height: AppStyle.spasingHight,
              ),
              SizedBox(
                width: AppStyle.appWidth,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'A confirmation code has been sent to ',
                        style: TextStyle(color: Colors.black, fontSize: AppStyle.textNormalSize),
                      ),
                      TextSpan(
                        text: widget.num,
                        style: TextStyle(
                            color: Colors.black, fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' (Edit) ',
                        style: TextStyle(
                            color: Colors.blue, fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Please enter it below',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: AppStyle.textNormalSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              VerificationCode(
                onCompleted: (String value) {
                  setState(() {
                    _code = value;
                  });
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountDetails()));
                },
                onEditing: (bool value) {
                  setState(() {
                    _onEditing = value;
                  });
                  if (!_onEditing) FocusScope.of(context).unfocus();
                },
                keyboardType: TextInputType.number,
                length: 6,
                cursorColor: Colors.blue,
                underlineColor: Colors.amber,
                textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).primaryColor),
                clearAll: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'clear all',
                    style: TextStyle(color: Colors.blue[700], fontSize: 14.0, decoration: TextDecoration.underline),
                  ),
                ),
                margin: const EdgeInsets.all(12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> phoneSignIn({required String phoneNumber}) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: _onCodeSent,
        codeAutoRetrievalTimeout: _onCodeTimeout);
  }

  _onVerificationCompleted(PhoneAuthCredential authCredential) async {
    print('verification completed ${authCredential.smsCode}');
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      otpCode.text = authCredential.smsCode!;
    });
    if (authCredential.smsCode != null) {
      try {
        UserCredential credential = await user!.linkWithCredential(authCredential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'provider-already-linked') {
          await _auth.signInWithCredential(authCredential);
        }
      }
      setState(() {
        isLoading = false;
      });
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountDetails()));

      //Navigator.pushNamedAndRemoveUntil(context, Constants.homeNavigate, (route) => false);
    }
  }

  _onVerificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      showMessage('The phone number entered is invalid!');
    }
  }

  _onCodeSent(String verificationId, int? forceResendingToken) {
    this.verificationId = verificationId;
    print(forceResendingToken);
    print('code sent');
  }

  _onCodeTimeout(String timeout) {
    return null;
  }

  void showMessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () async {
                  Navigator.of(builderContext).pop();
                },
              )
            ],
          );
        }).then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }
}
