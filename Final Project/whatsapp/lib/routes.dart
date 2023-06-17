import 'package:flutter/material.dart';
import 'package:whatsapp_app/common/widgets/error.dart';
import 'package:whatsapp_app/features/auth/screens/login_screen.dart';
import 'package:whatsapp_app/features/auth/screens/user_information_screen.dart';
import 'package:whatsapp_app/features/chat/screens/mobile_chat.dart';

import 'features/auth/screens/otp_screen.dart';
import 'features/select_contacts/screens/select_contacts_screens.dart';

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
      return MaterialPageRoute(builder: (context) => const UserInformationScreen()
      );
    case SelectContactsScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SelectContactsScreen()
      );
    case MobileChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      return MaterialPageRoute(builder: (context) => MobileChatScreen(
        name: name,
        uid : uid,
      )
      );
    default :
      return MaterialPageRoute(builder: (context) => const Scaffold(
        body: ErrorScreen(error: 'This Page dosen\'t exit.'),
      ));
  }
}