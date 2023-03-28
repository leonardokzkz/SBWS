import 'package:flutter/material.dart';
import 'package:aula/login.dart';
import 'package:aula/func/emergency.dart';
import 'package:aula/func/alert.dart';
import 'package:aula/func/profile.dart';


import 'package:aula/db/user.dart';

class HomePage extends StatefulWidget {
  UserModel? userData;
  HomePage(this.userData, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(7, 7, 67, 0.9),
        title: const Text('Segurança de BAIRRO WEBSAFE', textAlign: TextAlign.center,)
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 5),
            Container(
              child: Image.asset(
                'assets/images/camera-lentes01.png',
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmergencyPage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: SizedBox(
                width: 150,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.local_hospital,
                      size: 75,
                    ),
                    Text(
                      'Chamadas de\nEmergência',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AlertPage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
              ),
              child: SizedBox(
                width: 150,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.warning,
                      size: 75,
                    ),
                    Text(
                      'Criar Alerta',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProfilePage()),
                );
              },
              child: SizedBox(
                width: 150,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.person,
                      size: 75,
                    ),
                    Text(
                      'Ver perfil',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(7, 7, 67, 0.9)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginPage(),
                  ),
                );
              },
              child: const Text('Deslogar'),
            ),
          ],
        ),
      ),
    );
  }
}

