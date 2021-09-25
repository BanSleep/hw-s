import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'module/user.dart';

class UserInfoPage extends StatelessWidget {
  User userInfo;
  UserInfoPage({required this.userInfo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        centerTitle: true,
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Name ${userInfo.name}',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: _storyWhenStoryIsEmpty(),
              leading: Icon(Icons.person, color: Colors.black),
            ),
            ListTile(
              title: Text('Phone ${userInfo.phone}', style: TextStyle(fontWeight: FontWeight.w500),),
              leading: Icon(Icons.phone, color: Colors.black),
            ),
            Container(child: _emailWidgetWhileEmailIsEmpty()),
            ListTile(
              title: _countryWhenCountryIsEmpty(),
            )
          ],
        ),
      ),
    );
  }
  Widget? _emailWidgetWhileEmailIsEmpty() {
    if(userInfo.email!.isNotEmpty) {
      return ListTile(
        title: Text('Email ${userInfo.email}', style: TextStyle(fontWeight: FontWeight.w500),),
        leading: Icon(Icons.email, color: Colors.black,),
      );
    }else return null;
  }
  Widget? _countryWhenCountryIsEmpty() {
    if(userInfo.country != null) {
      return Text('Country ${userInfo.country}', style: TextStyle(fontWeight: FontWeight.w500),);
    }
    else return null;
  }
  Widget? _storyWhenStoryIsEmpty() {
    if(userInfo.story!.isNotEmpty) {
      return Text('Story ${userInfo.story}');
    }else return null;
  }
}