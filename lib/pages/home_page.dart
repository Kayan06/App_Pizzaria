import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListView(children: <Widget>[
        Positioned(
          bottom: 20,
          right: 20,
          child: Image.asset(
            "assets/images/Logo.png",
            height: 128,
            width: 128,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Image.asset(
          "assets/images/icon1.png",
          height: 128,
          width: 128,
        ),
        const SizedBox(
          height: 5,
        ),
        Image.asset(
          "assets/images/icon2.png",
          height: 128,
          width: 128,
        ),
        const SizedBox(
          height: 5,
        ),
        Image.asset(
          "assets/images/icon3.png",
          height: 128,
          width: 128,
        ),
        const SizedBox(
          height: 5,
        ),
        Image.asset(
          "assets/images/icon4.png",
          height: 128,
          width: 128,
        ),
      ]),
    );
  }
}
