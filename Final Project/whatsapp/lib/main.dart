import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_app/colors.dart';
import 'package:whatsapp_app/common/widgets/error.dart';
import 'package:whatsapp_app/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_app/features/landing/landing_screen.dart';
import 'package:whatsapp_app/firebase_options.dart';
// import 'package:whatsapp_app/responsive/responsive_layout.dart';
import 'package:whatsapp_app/routes.dart';
import 'package:whatsapp_app/screens/mobile_screen_layout.dart';

import 'common/widgets/loader.dart';
// import 'package:whatsapp_app/screens/mobile_screen_layout.dart';
// import 'package:whatsapp_app/screens/web_screen_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          color: appBarColor,
        )
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
          data: (user) {
            if(user == null){
              return const LandingScreen();
            }
            return const MobileScreenLayout();
          },
          error: (err, trace){
            return ErrorScreen(error: err.toString());
          },
          loading: () => const Loader())
    );
  }
}


