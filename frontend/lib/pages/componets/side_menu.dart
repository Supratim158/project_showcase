import 'package:flutter/material.dart';
import '../../config/size_config.dart';
import '../profile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.defaultWidth * 35,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildHeaderContainer(context), // Pass context here
            _buildDrawerItem(
              icon: Icons.person,
              title: 'Profile',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfilePage()),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.work,
              title: 'Projects',
              onTap: () {
                Navigator.pop(context);
                // Navigate to projects page
              },
            ),
            _buildDrawerItem(
              icon: Icons.star,
              title: 'Showcase',
              onTap: () {
                Navigator.pop(context);
                // Navigate to showcase page
              },
            ),
            _buildDrawerItem(
              icon: Icons.contact_page,
              title: 'Contact',
              onTap: () {
                Navigator.pop(context);
                // Navigate to contact page
              },
            ),
          ],
        ),
      ),
    );
  }

  // Pass context as parameter
  Widget _buildHeaderContainer(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProfilePage()),
        );
      },
      child: Container(
        height: SizeConfig.defaultHeight * 29, // Maintain increased height
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF031330), // Dark blue
              Color(0xFF053563), // Lighter dark blue
              Color(0xFF07536C),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50, // Maintain larger avatar size
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 60, // Maintain larger icon size
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: SizeConfig.defaultHeight * 0.75), // Maintain spacing
            const Text(
              'John Doe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24, // Maintain larger font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14),
      ),
      onTap: onTap,
    );
  }
}
