import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_app/features/auth/repositry/auth_repositry.dart';

final authControllerProvider = Provider(
        (ref) {
          final authRepositry = ref.watch(authRepositryProvider);
          return AuthController(authRepositry: authRepositry);
        }
);

class AuthController{
  final AuthRepositry authRepositry;

  AuthController( {required this.authRepositry});

  void signInWithPhone(BuildContext context,String phoneNumber){
    authRepositry.signInWithPhone(context, phoneNumber);
  }

  void verifyOTP(BuildContext context,String verificationId, String userOTP){
    authRepositry.verifyOTP(context: context, verificationId: verificationId, userOTP: userOTP);
  }
}