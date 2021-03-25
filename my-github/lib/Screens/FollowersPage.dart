import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mygithub/Providers/UserProvider.dart';
import 'package:mygithub/Requests/GithubRequest.dart';
import 'package:mygithub/models/User.dart';
import 'package:provider/provider.dart';

class FollowersPage extends StatefulWidget {
  @override
  _FollowersPageState createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {
  //instantiate a User class
  User user;

  // instantiate a list of users as a placeholder for thr followers
  List<User> followers;
  @override
  Widget build(BuildContext context) {
    setState(() {
      //this function gets a user from the username supplied in the input
      user = Provider.of<UserProvider>(context).getUser();

      // this method returns followers of the username supplied in the input as a list
      //using the UserProvider
      Github(user.login).fetchFollowers().then((following) {
        Iterable list = json.decode(following.body);
        setState(() {
          followers = list.map((e) => User.fromJson(e)).toList();
        });
      });
    });
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              brightness: Brightness.light,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.white,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black87.withOpacity(0.9)),
                  // color: Colors.black87,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(user.avatarUrl),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        user.login,
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                height: 600,
                child: followers != null
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: followers.length, // the number of followers a user has
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey[200])),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 50,
                                      width: 50,
                                      child: CircleAvatar(
                                        // followers's profile picture
                                        backgroundImage: NetworkImage(followers[index].avatarUrl),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      followers[index].login, //follower's username
                                      style:
                                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey[700]),
                                    )
                                  ],
                                ),
                                Row(children: <Widget>[
                                  Icon(
                                    Icons.location_city_sharp,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  followers[index].location != null
                                      ? Text(
                                          followers[index].location,
                                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
                                        )
                                      : Text(
                                          "Not Available",
                                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
                                        )
                                ])
                              ],
                            ),
                          );
                        },
                      )
                    : Container(
                        child: Align(
                            child: Text(
                                'Hold on, we are fetching your followers list..'))), // before the data is returned, indicate loading data
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
