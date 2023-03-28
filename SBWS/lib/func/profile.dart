import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:aula/db/database_helper.dart';
import 'package:aula/db/user.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  UserModel user = UserModel('userName','email','password');

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    Database? db = await databaseHelper.db;

    final List<Map<String, dynamic>> maps = await db!.query('user');
    if (maps.length > 0) {
      setState(() {
        user = UserModel.fromMap(maps.first);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(7, 7, 67, 0.9), 
        title: Text('Meu Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            CircleAvatar(
              radius: 110.0,
              backgroundColor: Color.fromRGBO(7, 7, 67, 0.9),
              child: Icon(Icons.person, size: 100, color: Colors.white),
            ),
            SizedBox(height: 20.0),
            Text(
              user.userName,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 10.0),
            Text(
              user.email,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
