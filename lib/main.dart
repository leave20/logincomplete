import 'package:flutter/material.dart';
import 'package:logincomplete/src/bloc/Provider.dart';
import 'package:logincomplete/src/pages/home_page.dart';
import 'package:logincomplete/src/pages/login_page.dart';
import 'package:logincomplete/src/pages/product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App',
        initialRoute: 'home',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'product':(BuildContext context) => ProductPage()
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple
        ),
      ),
    );
  }
}
