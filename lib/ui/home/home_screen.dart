import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs=[];
  int selectIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "ToDo List",
          style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(fontWeight: FontWeight.w700,),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        onTap: (index){
          setState(() {
            selectIndex = index;
          });
        },
          
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_rounded),
            label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "",
            ),
          ]
      ),
    );
  }
}
