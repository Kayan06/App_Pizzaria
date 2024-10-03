import 'package:app_pizzaria/components/my_current_location.dart';
import 'package:app_pizzaria/components/my_description_box.dart';
import 'package:app_pizzaria/components/my_drawer.dart';
import 'package:app_pizzaria/components/my_food_tile.dart';
import 'package:app_pizzaria/components/my_sliver_app_bar.dart';
import 'package:app_pizzaria/components/my_tab_bar.dart';
import 'package:app_pizzaria/models/food.dart';
import 'package:app_pizzaria/models/restaurant.dart';
import 'package:app_pizzaria/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // tab controller

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

// separar a lista de pizzas e bebidas nos seus lugares

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.FoodCategory == category).toList();
  }

  // retornar lista de comida  em determinada categoria
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      // menu categoria
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          // comida individual
          final food = categoryMenu[index];
          // return comida UI
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FoodPage(
                        food: food,
                      )),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
              title: MyTabBar(tabController: _tabController),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Colors.black,
                  ),
                  // my current location

                  MyCurrentLocation(),

                  // caixa de descrição
                  MyDescriptionBox(),
                ],
              )),
        ],
        body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
                  controller: _tabController,
                  children: getFoodInThisCategory(restaurant.menu),
                )),
      ),
    );
  }
}
