import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_app/common/utils/utils.dart';
import 'package:whatsapp_app/features/auth/screens/otp_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositryProvider = Provider(
        (ref) => AuthRepositry(
          auth: FirebaseAuth.instance,
          firestore: FirebaseFirestore.instance
        ));

class AuthRepositry {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepositry({
    required this.auth,
    required this.firestore
  });

  void signInWithPhone(BuildContext context, String phoneNumber) async{
    try{
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async{
          await auth.signInWithCredential(credential);
          },
          verificationFailed: (e){
          throw Exception(e.message);
          },
          codeSent: ((String verificationId, int? resendToken) async{
            Navigator.pushNamed(
              context,
              OTPScreen.routeName,
              arguments: verificationId
            );
          }),
          codeAutoRetrievalTimeout: (String verificationId){},
      );
    }
    on FirebaseAuthException catch (e){
      showSnackBar(context: context, content: e.message!);
    }
  }
}