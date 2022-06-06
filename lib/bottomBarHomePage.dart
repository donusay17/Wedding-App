import 'package:bootcamp165/pages/home_page.dart';
import 'package:bootcamp165/screens/splash/components/openingPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(bottomBarHomePage());

class bottomBarHomePage extends StatefulWidget {
  @override
  State<bottomBarHomePage> createState() => _bottomBarHomePageState();
}

class _bottomBarHomePageState extends State<bottomBarHomePage> {
  int _selectedIndex = 0;

  final tabs=[
    homePage(),
    homePage()
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: tabs[_selectedIndex],
      floatingActionButton:  FloatingActionButton(
        backgroundColor:  Color(0xFFFF7643),

        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 4.0,
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
          backgroundColor:  Color(0xFFFF7643),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box_rounded),
          label: '',
          backgroundColor:  Color(0xFFFF7643),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (index) {
        setState(() {
          _selectedIndex=index;
          print(_selectedIndex);
        });
      }
      ,
    );
  }
}
