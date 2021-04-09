import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:work_app/auth_Ui/login_screen.dart';
import 'Menu.dart';
import 'custom_list_title.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController;
  final DateFormat _dateFormatter = DateFormat('dd MMM');
  final DateFormat _timeFormatter = DateFormat('h:mm');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  Widget _buildcategoryCard(int index, String title, int count) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      height: 200.0,
      width: 150.0,
      decoration: BoxDecoration(
        color: _selectedIndex == index ? Colors.pink : Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          _selectedIndex == index
              ? BoxShadow(
                  color: Colors.black, offset: Offset(0, 2), blurRadius: 10.0)
              : BoxShadow(color: Colors.transparent)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              title,
              style: TextStyle(
                  color: _selectedIndex == index ? Colors.white : Colors.black,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              count.toString(),
              style: TextStyle(
                  color: _selectedIndex == index ? Colors.white : Colors.black,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                      Colors.blue,
                      Colors.deepPurpleAccent,
                    ],
                        stops: [
                      0.1,
                      0.8,
                    ])),
                child: null
            ),

            CustomListTitle(Icons.person, 'Profile', () => {}),
            SizedBox(height: 10),
            CustomListTitle(
                Icons.notifications,
                'Profile',
                () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) =>  LoginScreen()))}),
            SizedBox(height: 10),
            CustomListTitle(Icons.settings, 'Settings', () => {}),
            SizedBox(height: 10),
            CustomListTitle(
                Icons.lock,
                'Log Out',
                () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginScreen()))
                    }),
            SizedBox(height: 40.0),
          ],
        ),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                Colors.blue,
                Colors.blueAccent,
                Colors.deepPurpleAccent,
                Colors.deepPurple,
              ],
                  stops: [
                0.1,
                0.4,
                0.7,
                0.9
              ])),
          child: MyHome()
      ),
    );
  }
}
