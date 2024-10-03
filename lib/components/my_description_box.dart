import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //taxa de entrega
          Column(
            children: [
              Text('\$0.00'),
              Text("Taxa de Entrega"),
            ],
          ),

          // tempo de entrega
          Column(
            children: [
              Text("15-30 minutos"),
              Text("Tempo de Entrega"),
            ],
          )
        ],
      ),
    );
  }
}
