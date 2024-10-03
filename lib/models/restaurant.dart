import 'package:app_pizzaria/models/cart_item.dart';
import 'package:app_pizzaria/models/food.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class Restaurant extends ChangeNotifier {
//Restaurantes
  final List<Food> _menu = [
    Food(
        name: "Pizza de Pepperoni",
        Description: "Queijo, Molho de Tomate, Pepperoni e Orégano",
        imagePath: "lib/images/pizzas/PizzadePepperoni.png",
        Price: 30.0,
        FoodCategory: FoodCategory.Pizzas),
    Food(
        name: "Pizza de Frango com Catupiry",
        Description:
            "Molho de Tomate, Mussarela, Frango Desfiado, Catupiry e Orégano",
        imagePath: "lib/images/PizzadeFrangocomCatupiry.png",
        Price: 30.0,
        FoodCategory: FoodCategory.Pizzas),
    Food(
        name: "Pizza Doce OreoeMorango",
        Description: "Metade de Chocolate Preto, Oreo e Metade de Morango",
        imagePath: "lib/images/pizzas/PizzaDoceOreoeMorango.png",
        Price: 35.0,
        FoodCategory: FoodCategory.Pizzas),
    Food(
        name: "Pizza Portugesa",
        Description:
            "Molho de Tomate, Mussarela, Tomate, Presunto, Cebola, Ovos, Pimentão, Milho e Orégano",
        imagePath: "lib/images/pizzas/PizzadePortuguesa.png",
        Price: 30.0,
        FoodCategory: FoodCategory.Pizzas),

//Bebidas

    Food(
        name: "Coca-Cola 2L",
        Description: "Refrigerante 2L",
        imagePath: "lib/images/bebidas/CocaCola.png",
        Price: 6.0,
        FoodCategory: FoodCategory.Bebidas),
    Food(
        name: "Coca-Cola Zero 2L",
        Description: "Refrigerante 2L",
        imagePath: "lib/images/bebidas/CocaColaZero.png",
        Price: 6.0,
        FoodCategory: FoodCategory.Bebidas),
    Food(
        name: "Sprite 2L",
        Description: "Refrigerante 2L",
        imagePath: "lib/images/bebidas/Sprite.png",
        Price: 6.0,
        FoodCategory: FoodCategory.Bebidas),
    Food(
        name: "Guarana Fruki 2L",
        Description: "Refrigerante 2L",
        imagePath: "lib/images/bebidas/GuaranaFruki.png",
        Price: 5.0,
        FoodCategory: FoodCategory.Bebidas),
  ];

/*
GETTERS

*/
  List<Food> get menu => _menu;

/*
OPERATIONS

*/
// carrinho
  final List<CartItem> _cart = [];

// adicionar ao carrinho
  void addToCart(food) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      return isSameFood;
    });
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(food: food),
      );
    }
    notifyListeners();
  }

// remover do carrinho
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
  }

// Preço Final
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.Price;

      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

// Numero de itens no carrinho
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

// limpar o carrinho
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
/*

HELLPERS

*/
}
