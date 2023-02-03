import 'package:flutter/material.dart';
import 'package:untitled6/model/User.dart';

class UserInFoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    User userinfo;
    UserInFoPage();

    return Scaffold(
      appBar: AppBar(
        title: Text('User info'),
        centerTitle: true,
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Name\t',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Story'),
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              trailing: Text('Country'),
            )
          ],
        ),
      ),
    );
  }

}