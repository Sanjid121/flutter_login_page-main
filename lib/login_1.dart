import 'package:flutter/material.dart';
import 'package:flutter_login_page/Register.dart';
import 'package:flutter_login_page/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login1 extends StatefulWidget {
  const Login1({Key? key}) : super(key: key);

  @override
  _Login1State createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  usarLogin() async {
    SharedPreferences ss = await SharedPreferences.getInstance();
    if (emailController.text == "" || passwordController.text == "") {
      print("empty");
    } else {
      String email = ss.getString('email')!;
      String password = ss.getString('password')!;

      if (email == emailController.text &&
          password == passwordController.text) {
        ss.setString('login', 'true');
        Navigator.push(context, MaterialPageRoute(builder: (_) => Login1()));
      } else {
        print("invalid");
      }
    }
  }

  void initState() {
    Future.delayed(Duration(microseconds: 1), () async {
      SharedPreferences ss = await SharedPreferences.getInstance();
      if (ss.getString('login') != null) {
        if (ss.getString('login') == 'true') {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => HomePage()));
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Register()));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Container(
              child: Text(
                'Login',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 5),
          Card(
            shadowColor: Colors.blueAccent,
            elevation: 20,
            margin: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Container(
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email or Phone',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          backgroundColor: Color(0xFF00BFA5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          await usarLogin();
                        },
                        child: Text('Login'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          backgroundColor: Color.fromARGB(255, 211, 213, 213),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Register()));
                        },
                        child: Text('Register'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
