import 'package:app_pizzaria/components/my_button.dart';
import 'package:app_pizzaria/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

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
            height: 25,
          ),

          MyTextfield(
            controller: confirmpasswordController,
            hintText: "Confirme Sua Senha",
            obscureText: true,
          ),

          const SizedBox(
            height: 15,
          ),
          //sign in button
          MyButton(
            text: "Registrar",
            onTap: () {},
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
                  "Já possui Registro, Clique Aqui",
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
