import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(7, 7, 67, 0.9),
        title: Text('Criar Alerta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/images/camera-lentes01.png',
              height: 150,
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.amber,
              child: Text(
                'Por favor, descreva abaixo o seu alerta de suspeita. Se possível, compartilhe também fotos, vídeos ou áudios relevantes. Não se esqueça de informar seu nome e endereço para que possamos ajudá-lo da melhor maneira possível.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descrição',
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.attach_file),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.mic),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
