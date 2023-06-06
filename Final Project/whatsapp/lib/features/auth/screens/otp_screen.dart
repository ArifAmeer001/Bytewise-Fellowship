import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  static const String routeName = '/otp-screen';
  final String verficationId;
  const OTPScreen({Key? key, required this.verficationId}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
