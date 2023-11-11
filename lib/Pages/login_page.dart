// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../Widgets/login_widgets.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool isSigninPage = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var verificationID = '';
  bool otpSent = false;
  TextEditingController otpController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Future<bool> confirmOTP(String otp) async{
    UserCredential? credentials;
    try{
      credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationID,
          smsCode: otp
        ) 
      );
    } catch(e){
      SnackBar(content: Text("Error: $e"),behavior: SnackBarBehavior.floating,);
      print('Error: $e');
    }
    return credentials?.user != null ? true : false;
  }

  Future<dynamic> optScreen(){
    // FirebaseAuth.instance.signOut();
    return showModalBottomSheet(
    // isDismissible: false,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black38,
    context: context,
    builder:  (context) {
      return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
          ),
          child: Column(
            children: [
              const Text(
                'Confirm OTP',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                'An OTP has been sent to you mobile number. Please enter it below to continue.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12

                ),
              ),
              const SizedBox(height: 10,),
              Pinput(controller: otpController, length: 6),
              const SizedBox(height: 10,),
              CustomButton(
                text: 'Confirm',
                function: () async{
                  bool otpConfirm = await confirmOTP(otpController.text.trim());
                  if(context.mounted) Navigator.of(context).pop();
                  if(otpConfirm){
                    // SnackBar(content: Text('OTP Confirmed'));
                    print('OTP Confirmed');
                  } else {
                    // SnackBar(content: Text('Some error has occoured'),);
                    print('OTP not Confirmed');
                  }
                  if(context.mounted) Navigator.pop(context);
              },
              )
            ],
          ),
      );
    },);
  }
  Future<void> phoneLogin(String phoneNumber) async{
    print(phoneNumber);
    showDialog(context: context, builder: (context) => 
      const AlertDialog(
        content: CupertinoActivityIndicator(),
      )
    );
    try{
      await _auth.verifyPhoneNumber(
        phoneNumber: '+91 $phoneNumber',
        timeout: const Duration(minutes: 2),
        verificationCompleted: (phoneAuthCredential) async{
          print(phoneAuthCredential);
          await _auth.signInWithCredential(phoneAuthCredential);
        }, verificationFailed: (error) {
          print(error);
          SnackBar(content: Text('FirebaseError: ${error.toString()}'),);
        }, codeSent: (verificationId, forceResendingToken) {
          print('$verificationId + $forceResendingToken');
          setState(() {
            verificationID = verificationId;
          });
          optScreen();
          // showDialog(context: context, builder: (context) => const SnackBar(content: Text('Code Sent'),),);
        }, codeAutoRetrievalTimeout: (verificationId) {
          print(verificationId);
          setState(() {
            verificationID = verificationId;
          });
        },);
    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        print('user not found');
      } else if(e.code == 'wrong password'){
        print('wrong-password bruv');
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1694390786624-f9afc128c669?auto=format&fit=crop&q=80&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
              ),
              fit: BoxFit.cover
            )
          ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black.withAlpha(20), blurRadius: 10)]
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(13),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 25, 25, 25),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: const Icon(Icons.person, color: Colors.white,)
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration:  BoxDecoration(
                        // color: const Color.fromARGB(255, 235, 235, 235),
                        color: Colors.white,
                        borderRadius: const  BorderRadius.all(Radius.circular(12)),
                        border: Border.all(width: 0.8, color: const Color.fromARGB(255, 200, 200, 200)),
                        boxShadow: [BoxShadow(color: Colors.black.withAlpha(15), blurRadius: 10)]
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomInputField(hintText: 'Name', controller: TextEditingController(),),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            height: 0.8,
                            color: const Color.fromARGB(255, 200, 200, 200),
                          ),
                          CustomInputField(hintText: 'Mobile Number', controller: phoneNumberController,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    CustomButton(text: 'Continue', function: () => phoneLogin(phoneNumberController.text.trim().toString()),),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const SizedBox(width: 10,),
                        Expanded(child: Container(height: 0.8, color: const Color.fromARGB(255, 200, 200, 200))),
                        const Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'or',
                            style: TextStyle(
                              color: Color.fromARGB(255, 100, 100, 100),
                              fontSize: 12
                            ),
                          ),
                        ),
                        Expanded(child: Container(height: 0.8, color: const Color.fromARGB(255, 200, 200, 200))),
                        const SizedBox(width: 10,),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    CustomButton(text: 'Skip', function: (){
                      ScaffoldMessenger
                        .of(context)
                          .showSnackBar(
                            const SnackBar(
                              content: Text('Not Available At the Moment!', style: TextStyle(color: Colors.black),),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.white,

                            )
                          );
                    }),
                    const SizedBox(height: 15,),
                    const Text(
                      'By continuing you agree to our \nTerms & Conditions and our Privacy Policy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11.5,
                        color: Color.fromARGB(255, 80, 80, 80)
                      ),
                    ),
                    // const SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

