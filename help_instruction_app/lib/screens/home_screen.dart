import 'package:flutter/material.dart';
import 'package:help_instruction_app/screens/animations_screen.dart';
import 'package:help_instruction_app/screens/category_screen.dart';
import 'package:help_instruction_app/screens/favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> _screens = [
    CategoryScreen(),
    FavoritesScreen(),
    AnimationsScreen(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Colors.white,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        unselectedItemColor: Colors.white.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category_rounded), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'), 
          BottomNavigationBarItem(icon: Icon(Icons.animation), label: 'Animations'),
        ],
      ),
    );
  }
}