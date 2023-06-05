import 'package:flutter/material.dart';
import 'package:whatsapp_app/colors.dart';
import 'package:whatsapp_app/common/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('WhatsApp will need to verify your phone number'),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text('Pick Country'),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text('+92'),
                const SizedBox(width: 10),
                SizedBox(
                  width: size.width*0.7,
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      hintText: 'phone number'
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height*0.6),
            SizedBox(
              width: 90,
              child: CustomButton(
                  text: 'NEXT',
                  onPressed: () {}
              ),
            )
          ],
        ),
      ),
    );
  }
}
