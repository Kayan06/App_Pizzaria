import 'package:app_pizzaria/components/my_drawer_tile.dart';
import 'package:app_pizzaria/pages/setting_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SizedBox(
              width: 120,
              height: 120,
              child: Image.asset("assets/images/Logo.png"),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),

          //home list tile
          MyDrawerTile(
            text: "I N I C I O",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          //settings list tile
          MyDrawerTile(
              text: "C O N F I G U R A Ç Õ E S",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingPage(),
                    ));
              }
              //logout list tile
              ),

          MyDrawerTile(
            text: "S A I R",
            icon: Icons.logout,
            onTap: () {},

            //logout list tile
          ),
        ],
      ),
    );
  }
}
