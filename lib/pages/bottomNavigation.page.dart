import 'package:alugueai_mobile/pages/home.page.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> navigatePages = [
    HomePage(),
    Center(
      child: Text("Alugueis"),
    ),
    Center(
      child: Text("chat"),
    ),
    Center(
      child: Text("perfil"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigatePages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightBlue[200],
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ('Início'),
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.featured_play_list_rounded),
              label: ('Alugueis'),
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_rounded),
              label: ('Chat'),
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: ('Perfil'),
              backgroundColor: Colors.lightBlue),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
