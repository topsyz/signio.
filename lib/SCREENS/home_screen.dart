import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int index=0 ;
  final pages=[
    Center(child: Text('page 1',style: TextStyle(fontSize: 37),),),
    Center(child: Text('page 2',style: TextStyle(fontSize: 37),),),
    Center(child: Text('page 3',style: TextStyle(fontSize: 37),),),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
      selectedIndex: index,
     onDestinationSelected: (index)=> setState(()=>this.index=index),
     height: 60,
        destinations: [
          NavigationDestination(
              icon:Icon (Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'home'),
          NavigationDestination(
              icon:Icon (Icons.category),
              selectedIcon: Icon(Icons.home),
              label: 'category'),
          NavigationDestination(
              icon:Icon (Icons.history),
              selectedIcon: Icon(Icons.home),
              label: 'history'),
        ],
    ),

    );
  }
}
