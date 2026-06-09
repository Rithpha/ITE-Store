import 'package:flutter/material.dart';
import 'package:flutter_application_api/app/config.dart';
import 'package:flutter_application_api/screen/home_screen.dart';
import 'package:flutter_application_api/screen/cart_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config().appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,

        // change background color of ENV UAT Test
        // scaffoldBackgroundColor: Config.env == 'uat' ? Colors.red : null,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/cart': (context) => const CartScreen(),
      },
    );
  }
}
