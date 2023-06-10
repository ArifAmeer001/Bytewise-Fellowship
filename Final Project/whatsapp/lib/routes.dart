import 'package:flutter/material.dart';
import 'package:whatsapp_app/common/widgets/error.dart';
import 'package:whatsapp_app/features/auth/screens/login_screen.dart';
import 'package:whatsapp_app/features/auth/screens/user_information_screen.dart';

import 'features/auth/screens/otp_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case OTPScreen.routeName:
      final verficationId = settings.arguments as String;
      return MaterialPageRoute(builder: (context) => OTPScreen(
        verficationId: verficationId,
      ));
    case UserInformationScreen.routeName:
      return MaterialPageRoute(builder: (context) => const UserInformationScreen());
    default :
      return MaterialPageRoute(builder: (context) => const Scaffold(
        body: ErrorScreen(error: 'This Page dosen\'t exit.'),
      ));
  }
}