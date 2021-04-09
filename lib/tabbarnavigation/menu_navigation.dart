import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:work_app/CardDetail/CardDetail.dart';
import 'package:work_app/HomeScreen/Menu.dart';
import 'package:work_app/HomeScreen/custom_list_title.dart';
import 'package:work_app/auth_Ui/login_screen.dart';
import 'package:work_app/page/cards.dart';
import 'package:work_app/page/profile.dart';
import 'package:work_app/page/setting.dart';

class MenuNavigation extends StatefulWidget {
  MenuNavigation({Key key}) : super(key: key);

  @override
  _MenuNavigationState createState() => _MenuNavigationState();
}

class _MenuNavigationState extends State<MenuNavigation> {
  int _selectedPage = 0;
  final _pageOption = [Setting(),  DashBoard(),Setting(),LoginScreen ()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.black,

      ),
      drawer: Drawer(

          child: ListView(
            children: <Widget>[
       /* DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                  Colors.black87,
                  Colors.greenAccent,
                ],
                    stops: [
                  0.1,
                  0.8,
                ])),
            child: null),*/
            Container(
              height:700,
             color: Colors.black,
             /* decoration:  BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black,
                        Colors.black87,
                        Colors.black,
                        Colors.deepPurple,
                      ],
                      stops: [
                        0.1,
                        0.4,
                        0.7,
                        0.9
                      ])
              ),*/
              child: ListView(
                children:<Widget> [
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

          ],
          ),
      ),
      body: _pageOption[_selectedPage],
      bottomNavigationBar: ConvexAppBar(
        color: Colors.blueGrey,
        backgroundColor: Colors.black87,
        curveSize: 10.0,
        height: 40.0,
        activeColor: Colors.lightBlueAccent,
        items: [
          TabItem(icon: Icons.thermostat_sharp,),
          TabItem(icon: Icons.card_travel_outlined),
          TabItem(icon: Icons.person),
          TabItem(icon: Icons.settings),
        ],
        initialActiveIndex: _selectedPage,
        onTap:(int index){
          setState(() {
            _selectedPage=index;
          });
        } ,
      ),
    );
  }
}
