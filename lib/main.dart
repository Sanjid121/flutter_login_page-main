import 'package:flutter/material.dart';
import 'package:flutter_login_page/login_1.dart';


void main() {
  runApp(MaterialApp( 
    debugShowCheckedModeBanner: false,
    home: Login1(),
  ));
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

@override
class _MainState extends State<Main> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        
      ),
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}
