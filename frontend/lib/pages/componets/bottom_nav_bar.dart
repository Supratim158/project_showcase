import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_showcase/pages/all_projects.dart';
import 'package:project_showcase/pages/home_page.dart';
import 'package:project_showcase/pages/profile.dart';
import 'package:project_showcase/pages/settings.dart';

import '../../widgets/navBarWidget.dart';
import '../project_submit/project_submit_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    HomePage(token: "dummy"),
    AllProjects(),
    Placeholder(),
    ProfilePage(),
    Settings(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarItem(
              icon: CupertinoIcons.home,
              label: 'Home',
              isSelected: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            NavBarItem(
              icon: CupertinoIcons.list_bullet,
              label: 'My Projects',
              isSelected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
            const SizedBox(width: 40),
            NavBarItem(
              icon: CupertinoIcons.profile_circled,
              label: 'Profile',
              isSelected: _selectedIndex == 3,
              onTap: () => _onItemTapped(3),
            ),
            NavBarItem(
              icon: CupertinoIcons.settings,
              label: 'Settings',
              isSelected: _selectedIndex == 4,
              onTap: () => _onItemTapped(4),
            ),

          ],
        ),
      ),
      floatingActionButton: ClipOval(
        child: Material(
          color: Colors.blue,
          elevation: 10,
          child: InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectSubmitPage(),
                ),
              );
            },
            child: SizedBox(
              width: 70,
              height: 70,
              child: Icon(CupertinoIcons.add_circled,size: 30,color: Colors.white,),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }


}
