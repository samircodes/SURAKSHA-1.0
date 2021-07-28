import 'package:flutter/material.dart';
import 'package:suraksha/Screens/home.dart';
import 'package:suraksha/Screens/helpline.dart';
import 'package:suraksha/Screens/more.dart';
import 'package:suraksha/maps/map.dart';


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List pageOptions = [Home(), HelplinePage(), MapPage(),More()];
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[250],
        selectedItemColor: Colors.lightBlue[200],
        selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 17, color: Colors.black),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 17, color: Colors.black),
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        currentIndex: page,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 32,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
              size: 32,
            ),
            label: "Helpline",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              size: 32,
            ),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_add,
              size: 32,
            ),
            label: "More",
          )
        ],
      ),
      body: pageOptions[page],
    );
  }
}
