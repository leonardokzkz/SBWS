import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(7, 7, 67, 0.9),
        title: const Text('Emergência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              'Lista de emergência',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _ContactItem(
                  name: 'Guarda Municipal',
                  number: '153',
                  textColor: Colors.red,
                ),
                _ContactItem(
                  name: 'Disque Denúncia',
                  number: '181',
                  textColor: Colors.red,
                ),
                _ContactItem(
                  name: 'Polícia Militar',
                  number: '190',
                  textColor: Colors.red,
                ),
                _ContactItem(
                  name: 'SAMU',
                  number: '192',
                  textColor: Colors.red,
                ),
                _ContactItem(
                  name: 'Bombeiros',
                  number: '193',
                  textColor: Colors.red,
                ),
                _ContactItem(
                  name: 'Defesa Civil',
                  number: '199',
                  textColor: Colors.red,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/images/camera-lentes01.png',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final String name;
  final String number;
  final Color textColor;

  const _ContactItem({
    Key? key,
    required this.name,
    required this.number,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical:10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: textColor,
            ),
          ),
          Text(
            number,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
