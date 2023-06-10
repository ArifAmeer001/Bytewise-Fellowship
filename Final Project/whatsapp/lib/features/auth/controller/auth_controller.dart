import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_app/features/auth/repositry/auth_repositry.dart';

final authControllerProvider = Provider(
        (ref) {
          final authRepositry = ref.watch(authRepositryProvider);
          return AuthController(authRepositry: authRepositry, ref: ref);
        }
);

class AuthController{
  final AuthRepositry authRepositry;
  final ProviderRef ref;

  AuthController({required this.ref, required this.authRepositry});

  void signInWithPhone(BuildContext context,String phoneNumber){
    authRepositry.signInWithPhone(context, phoneNumber);
  }

  void verifyOTP(BuildContext context,String verificationId, String userOTP){
    authRepositry.verifyOTP(context: context, verificationId: verificationId, userOTP: userOTP);
  }

  void saveUserDataToFirebase(
      BuildContext context, String name, File? profilePic) {
    authRepositry.userDataToFireBase(
        name: name,
        profilePic: profilePic,
        ref: ref,
        context: context
    );
  }
}