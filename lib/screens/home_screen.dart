import 'package:flutter/material.dart';
import 'package:praxis/widgets/home/download_users_content.dart';
import 'package:praxis/widgets/home/users_content.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _menuContents = [DownloadUsersContent(), UsersContent()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Praxis"), centerTitle: true,),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.download_for_offline),
              label: 'Descargar Usuarios',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Usuarios',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child:Center(child:_menuContents.elementAt(_selectedIndex))));
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }
}
