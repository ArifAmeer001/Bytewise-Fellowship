import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:working_with_provider/models/cart.dart';
import 'package:working_with_provider/models/catalog.dart';
import 'package:working_with_provider/screens/cart.dart';
import 'package:working_with_provider/screens/catalog.dart';
import 'package:working_with_provider/screens/login.dart';
import 'package:working_with_provider/common/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

void main() {
  setupWindow();
  runApp(const MyApp());
}

const double windowWidth = 400;
const double windowHeight = 800;

void setupWindow(){
  if( !kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS) ){
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Provider Demo');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen){
      setWindowFrame(Rect.fromCenter(
          center: screen!.frame.center,
          width: windowWidth,
          height: windowHeight,
      ));
    });
  }
}

GoRouter router(){
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/catalog',
        builder: (context, state) => const CatalogScreen(),
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => const CartScreen(),
      )
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart){
            if(cart == null) throw ArgumentError.notNull('Cart');
            cart.catalog = catalog;
            return cart;
          }
        )
      ],
      child: MaterialApp.router(
        title: 'Provider Demo',
        theme: appTheme,
        routerConfig: router(),
      ),
    );
  }
}
