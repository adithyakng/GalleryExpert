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
      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'GalleryExpert',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        body: SafeArea(
          child: LoadingPage(),
        ),
      ),
    );
  }
}
