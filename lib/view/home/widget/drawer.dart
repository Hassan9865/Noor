import 'package:flutter/material.dart';
import 'package:noor/view/home/home_viewModel.dart';
import 'package:stacked/stacked.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeviewModel(),
      builder: (context, viewModel, child) {
        return Drawer(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            children: [
              // Header with image and profile
              Container(
                height: 200,
                //
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Image.asset('assets/card_icon/moon.png', height: size / 7),

                    const SizedBox(height: 10),
                    const Text(
                      'Noor e Islam',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),

              // Menu Items
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildDrawerItem(
                      icon: Icons.person_outline,
                      title: 'Persone',
                      onTap: () {},
                    ),

                    _buildDrawerItem(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {},
                    ),
                    const Divider(height: 20),
                    _buildDrawerItem(
                      icon: Icons.share_outlined,
                      title: 'Share App',
                      onTap: () {},
                    ),
                    _buildDrawerItem(
                      icon: Icons.star_outline,
                      title: 'Rate App',
                      onTap: () {},
                    ),
                    _buildDrawerItem(
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
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[800]),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
