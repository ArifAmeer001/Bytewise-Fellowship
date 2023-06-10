import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_app/colors.dart';
import 'package:whatsapp_app/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_app/features/auth/repositry/auth_repositry.dart';

class OTPScreen extends ConsumerWidget {
  static const String routeName = '/otp-screen';
  final String verficationId;
  const OTPScreen({Key? key, required this.verficationId}) : super(key: key);

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP){
    ref.read(authControllerProvider).verifyOTP(context, verficationId, userOTP);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verifying your number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('We have sent a SMS with a code.'),
            SizedBox(
              width: size.width*0.5,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText:  '_ _ _ _ _ _',
                  hintStyle: TextStyle(fontSize: 30),
                ),
                keyboardType: TextInputType.number,
                onChanged: (val){
                  if(val.length == 6)
                    {
                      verifyOTP(ref, context, val.trim());
                    }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
