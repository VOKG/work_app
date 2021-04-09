
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:work_app/locators/locator_auth.dart';
import 'package:work_app/page/profile.dart';
import 'package:work_app/tabbarnavigation/menu_navigation.dart';
import 'package:work_app/view_controller/auth_controller.dart';
import 'package:work_app/view_controller/flutterfire.dart';

import 'auth_widget.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField =TextEditingController();

  final String data1 = 'Enter your Email';
  final String email = 'Email';
 IconData iconemail =Icons.email;
  IconData icondpass =Icons.lock_outline;
  bool obscureText = false;
  bool _rememberMe = false;
  final String password = 'Password';


Widget _buildEmail(String data,String data2,TextEditingController controller,IconData icondata){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:<Widget> [
      Text(
        data2,
        style: TextStyle(
          color:Colors.white,
          fontFamily: 'OpenSans',
          fontSize: 20.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      SizedBox(height: 10.0,),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow:  [
              BoxShadow(
                color: Colors.blue,
                offset: Offset.zero,
                blurRadius: 8.0,
                spreadRadius: 1.0,
              ),
            ]
        ),
        height: 60,
        child: TextFormField(
          obscureText: _rememberMe,
            controller:controller,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:EdgeInsets.only(top: 14),
              prefixIcon: Icon(icondata,
                color: Colors.black,
              ),
              hintText: data,
              fillColor: Colors.black
            )
        ),
      ),
    ],
  );
}

Widget _buildCheckbox(){
  return Container(
    child: Row(
      children:<Widget>[
        Theme(
          data: ThemeData(
              unselectedWidgetColor:Colors.white ),
          child:Checkbox(
            value: _rememberMe,
            checkColor: Colors.red,
            activeColor: Colors.white,
            onChanged: (value) {
              setState(() {
                _rememberMe = value;
              });
            },
          ) ,
        ),
        Text('Show Password and Login',
          style: TextStyle(
              color: Colors.white),
        )
      ],
    ),
  );
}
Widget _buildLogin (){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async{
          bool shoulNavigate = await singIn(_emailField.text, _passwordField.text);
          if(shoulNavigate){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=>MenuNavigation()));
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
        ),
        color: Colors.blueGrey,
        child: Text('LOGIN',
          style: TextStyle(
              color: Colors.black,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'
          ),
        ),
      ),
    ),
  );
}
  Widget _buildRegister (){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        // ignore: deprecated_member_use
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () async{
            bool shoulNavigate = await register(_emailField.text, _passwordField.text);
            if(shoulNavigate){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>MenuNavigation()));
            }
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)
          ),
          color: Colors.blueGrey,
          child: Text('REGISTRATION',
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans'
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.black,
      ),*/

      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
     child:GestureDetector(
       onTap: ()=> FocusScope.of(context).unfocus(),
     child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:<Color>
                [
                  Colors.black,

                  Colors.lightBlueAccent,
                ],
                stops: [0.1,22.0]
              )
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 80.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  Text (
                    'Sign In',
                    style: TextStyle(
                      color:Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  _buildEmail(data1,email,_emailField,iconemail),
                  SizedBox(height: 20.0,),
                  _buildEmail(password,password,_passwordField,icondpass),
                  SizedBox(height: 20.0,),
                  _buildCheckbox(),
                  _buildRegister(),
                  _buildLogin(),
                  Column(
                    children:<Widget> [
                      Text(
                        '-OR-',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Text(
                        'Sing in with'
                      )
                    ],
                  )

                ],
              ),
            ),
          )
        ],
      ),
     )
    )
    );
  }
}