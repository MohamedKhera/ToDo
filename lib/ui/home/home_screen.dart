import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/shared/auth_provider.dart';
import 'package:todo/ui/home/tabs/settings_tab.dart';
import 'package:todo/ui/home/tabs/tasks_tab.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    TasksTab(),
    SettingsTab(),
  ];
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    Authprovider provider = Provider.of<Authprovider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "ToDo List",
          style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await provider.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.routeName, (route) => false);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: tabs[selectIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.white,
        elevation: 0,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
            currentIndex: selectIndex,
            onTap: (index) {
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
            ]),
      ),
    );
  }
}
