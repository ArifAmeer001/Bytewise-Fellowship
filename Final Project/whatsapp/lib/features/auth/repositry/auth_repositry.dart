import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_app/common/repositories/common_firebase_storage.dart';
import 'package:whatsapp_app/common/utils/utils.dart';
import 'package:whatsapp_app/features/auth/screens/otp_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_app/features/auth/screens/user_information_screen.dart';
import 'package:whatsapp_app/models/user_model.dart';
import 'package:whatsapp_app/screens/mobile_screen_layout.dart';

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

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async{
    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: userOTP
      );
      await auth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
        context,
        UserInformationScreen.routeName,
          (routr) => false,
      );
    }
    on FirebaseAuthException catch (e){
      showSnackBar(context: context, content: e.message!);
    }
  }

  void userDataToFireBase({
    required String name,
    required File? profilePic,
    required ProviderRef ref,
    required BuildContext context,
}) async{
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl = 'https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

      if (profilePic != null) {
        photoUrl =
        await ref.read(commonFireBaseStorageProvider).storeFileToFireBase(
            'profilePic/$uid',
            profilePic
        );
      }
      var user = UserModel(
          name: name,
          profilePic: photoUrl,
          uid: uid,
          isOnline: true,
          phoneNumber: auth.currentUser!.uid,
          groupId: []
      );

      await firestore.collection('user').doc(uid).set(user.toMap());
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MobileScreenLayout(),
        ),
            (route) => false,
      );
    }
    catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}