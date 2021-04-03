import 'package:flutter/material.dart';
import 'package:gallery_expert/screens/loading_page.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery Expert',
      theme: ThemeData(primaryColor: Colors.orangeAccent),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: LoadingPage(),
      ),
    );
  }
}
