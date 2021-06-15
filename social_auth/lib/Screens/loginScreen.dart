import 'package:flutter/material.dart';
import 'package:social_auth/services/authservice.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double fontScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: Text("SOCIAL AUTH"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(
              left: 20, right: 20, top: size.height * 0.2, bottom: size.height * 0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hello, \nWelcome, login with,",
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: size.width * 0.1,
                      )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          AuthService().fbSignIn();
                        },
                        child: Image(width: 50, image: AssetImage('assets/icons/facebook.png')),
                      ),
                      SizedBox(width: 50),
                      GestureDetector(
                          onTap: () {
                            AuthService().signInWithGoogle();
                          },
                          child: Image(width: 55, image: AssetImage('assets/icons/google.png'))),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
