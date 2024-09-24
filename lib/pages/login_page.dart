import 'package:app_pizzaria/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:app_pizzaria/components/my_textfield.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login() {
    /*

   // fill out authentication here...

    */

    // navigate to home page
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: ListView(children: <Widget>[
          //logo
          SizedBox(
            width: 128,
            height: 128,
            child: Image.asset("assets/images/Logo.png"),
          ),

          const SizedBox(
            height: 25,
          ),

          //email textfield
          MyTextfield(
            controller: emailController,
            hintText: "E-mail",
            obscureText: false,
          ),
          const SizedBox(
            height: 25,
          ),
          //password textfield
          MyTextfield(
            controller: passwordController,
            hintText: "Senha",
            obscureText: true,
          ),
          const SizedBox(
            height: 15,
          ),
          //sign in button
          MyButton(
            text: "Entrar",
            onTap: login,
          ),
          const SizedBox(
            height: 10,
          ),

          //register
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Registrar",
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
