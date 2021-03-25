import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mygithub/Providers/UserProvider.dart';
import 'package:mygithub/Requests/GithubRequest.dart';
import 'package:mygithub/models/Repo.dart';
import 'package:mygithub/models/User.dart';
import 'package:provider/provider.dart';

class AllReposScreen extends StatefulWidget {
  @override
  _AllReposScreenState createState() => _AllReposScreenState();
}

class _AllReposScreenState extends State<AllReposScreen> {
  User user;
  Repository repo;
  List<Repository> repositories;
  @override
  Widget build(BuildContext context) {
    setState(() {
      user = Provider.of<UserProvider>(context).getUser();
      if (user = null) {
        Github(user.login).fetchRepos().then((data) {
          Iterable list = json.decode(data.body);
          setState(() {
            repositories = list.map((e) => Repository.fromJson(e)).toList();
          });
        });
      }
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
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                height: 600,
                child: repositories != null
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: repositories.length,
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
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                                Text(
                                  repo.name,
                                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          );
                        },
                      )
                    : Container(child: Align(child: Text('Loading Data...'))),
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
