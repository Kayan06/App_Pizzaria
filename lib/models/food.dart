class Food {
  final String name;
  final String Description;
  final String imagePath;
  final double Price;
  final FoodCategory;

  Food({
    required this.name,
    required this.Description,
    required this.imagePath,
    required this.Price,
    required this.FoodCategory,
  });
}

enum FoodCategory {
  Pizzas,
  Bebidas,
}
