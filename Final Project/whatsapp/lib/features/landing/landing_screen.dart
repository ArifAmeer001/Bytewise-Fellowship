import 'package:flutter/material.dart';
import 'package:whatsapp_app/colors.dart';
import 'package:whatsapp_app/common/widgets/custom_button.dart';

import '../auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {

  void navigateToLoginScreen(BuildContext context){
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              'Welcome to WhatsApp',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: size.height/9),
            Image.asset('assets/bg.png', height: 340, width: 340, color: tabColor,),
            SizedBox(height: size.height/9),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                style: TextStyle(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width*0.75,
              child: CustomButton(
                  text: 'Agree & Continue',
                  onPressed: () {
                    navigateToLoginScreen(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
