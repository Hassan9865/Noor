import 'package:flutter/material.dart';
import 'package:noor/view/home/home_viewModel.dart';
import 'package:stacked/stacked.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size.width;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeviewModel(),
      builder: (context, viewModel, child) {
        // double cardWidth =
        //     isTablet ? constraints.maxWidth * 0.6 : constraints.maxWidth * 0.9;

        return LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth >= 600;
            double titleSize = isTablet ? 30 : 18;
            double txtSize = isTablet ? 28 : 18;
            double imageSize = isTablet ? 65 : 45;
            double iconSize = isTablet ? 28 : 22;
            return Drawer(
              width:
                  isTablet
                      ? constraints.maxWidth * 0.6
                      : constraints.maxWidth * 0.7,
              // width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                children: [
                  // Header with image and profile
                  Container(
                    height: 200,
                    //
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: isTablet ? 30 : 10),
                        Image.asset(
                          'assets/card_icon/moon.png',
                          height: imageSize,
                        ),

                        SizedBox(height: isTablet ? 10 : 5),
                        Text(
                          'Noor e Islam',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Menu Items
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        _buildDrawerItem(
                          iconSize: iconSize,
                          txtSize: txtSize,
                          icon: Icons.person_outline,
                          title: 'Profile',
                          onTap: () {},
                        ),

                        _buildDrawerItem(
                          iconSize: iconSize,
                          txtSize: txtSize,
                          icon: Icons.settings_outlined,
                          title: 'Settings',
                          onTap: () {},
                        ),
                        const Divider(height: 20),
                        _buildDrawerItem(
                          iconSize: iconSize,
                          txtSize: txtSize,
                          icon: Icons.share_outlined,
                          title: 'Share App',
                          onTap: () {},
                        ),
                        _buildDrawerItem(
                          iconSize: iconSize,
                          txtSize: txtSize,
                          icon: Icons.star_outline,
                          title: 'Rate App',
                          onTap: () {},
                        ),
                        _buildDrawerItem(
                          iconSize: iconSize,
                          txtSize: txtSize,
                          icon: Icons.info_outline,
                          title: 'About Us',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),

                  // Footer
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'App Version 1.0.0',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: txtSize,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required double iconSize,
    required double txtSize,

    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[800], size: iconSize),
      title: Text(title, style: TextStyle(fontSize: txtSize)),
      onTap: onTap,
    );
  }
}
