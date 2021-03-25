import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mygithub/Providers/UserProvider.dart';
import 'package:mygithub/Screens/FollowersPage.dart';
import 'package:provider/provider.dart';

import 'Screens/FollowersPage.dart';

void main() => runApp(ChangeNotifierProvider<UserProvider>(
      create: (context) => UserProvider(),
      child: MaterialApp(
        home: Homepage(),
        debugShowCheckedModeBanner: false,
      ),
    ));

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _controller = TextEditingController();

  void _getUserToFollowers() {
    if (_controller.text == '') {
      Provider.of<UserProvider>(context).setMessage('Please enter you username');
    } else {
      Provider.of<UserProvider>(context).fetchUser(_controller.text).then((value) {
        if (value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FollowersPage()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Container(
              width: 80,
              height: 80,
              child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      NetworkImage('https://icon-library.net/images/github-icon-png/github-icon-png-29.jpg')),
            ),
            SizedBox(
              height: 30,
            ),
            Text("Github", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
            SizedBox(height: 90),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white.withOpacity(0.1)),
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  Provider.of<UserProvider>(context).setMessage(null);
                },
                enabled: !Provider.of<UserProvider>(context).isLoading(),
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    errorText: Provider.of<UserProvider>(context).getMessage(),
                    hintText: 'Github Username',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
            SizedBox(height: 15),
            MaterialButton(
              padding: EdgeInsets.all(20),
              color: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: Align(
                child: Provider.of<UserProvider>(context).isLoading()
                    ? CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        strokeWidth: 5,
                      )
                    : Text(
                        'GET YOUR FOLLOWERS',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
              ),
              onPressed: () {
                _getUserToFollowers();
              },
            ),
          ],
        ),
      ),
    ));
  }
}
