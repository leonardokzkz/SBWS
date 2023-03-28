import 'package:flutter/material.dart';
import 'package:aula/home.dart';
import 'package:aula/db/widgets/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:aula/db/user.dart';
import 'package:aula/db/database_helper.dart';
import 'package:aula/db/logic/alert_dialog.dart';
import 'package:aula/signup.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //preferencias de usuário
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  //form key
  final _formKey = GlobalKey<FormState>();
  //controllers para pegar o email e a senha
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //variável da base de dados
  var dbHelper;

  //função que realiza a verificação do email e da senha no banco de dados
  login() async {
    FocusManager.instance.primaryFocus?.unfocus;
    String email = emailController.text;
    String pass = passwordController.text;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await dbHelper.getLoginUser(email, pass).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomePage(userData)),
                    (Route<dynamic> route) => false);
          });
        } else {
          alertDialog(context, "Erro, usuário não encontrado!");
        }
      }).catchError((error) {
        alertDialog(context, "Erro ao fazer login!");
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;
    sp.setString("userName", user.userName);
    sp.setString("email", user.email);
    sp.setString("password", user.password);
  }

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
  }

  @override
  // Este é o widget principal que constrói a tela de login.
  Widget build(BuildContext context) {
    // Retorna um Scaffold com um SingleChildScrollView para que a tela possa ser rolada,
    // um Form com uma chave e um Column com os widgets para exibição na tela.
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                // Adiciona uma imagem envolta em um Container com margem superior
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(),
                  child: Image(
                    image: AssetImage('assets/images/camera-lentes01.png'),
                  ),
                ),
                // Adiciona um espaço em branco entre a imagem e o campo de email
                const SizedBox(height: 100),
                // Adiciona um campo de email personalizado
                CustomTextFormField(
                  controller: emailController,
                  icon: Icons.person,
                  hintName: 'Email',
                ),
                // Adiciona um espaço em branco entre o campo de email e o campo de senha
                const SizedBox(height: 20),
                // Adiciona um campo de senha personalizado
                CustomTextFormField(
                  controller: passwordController,
                  icon: Icons.lock,
                  hintName: 'Senha',
                  isObscureText: true,
                ),
                SizedBox(height: 30,
                ),
                // Adiciona um botão para realizar o login
                ElevatedButton(
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(7, 7, 67, 0.9)),
                ),
                  onPressed: login,
                  child: const Text('Entrar'),
                ),
                // Adiciona um espaço em branco entre o botão de login e o texto "Não tem uma conta?"
                const SizedBox(height: 50),
                // Adiciona uma linha de texto e um botão para ir para a tela de cadastro
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Não tem uma conta? '),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text('Registre-se'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}