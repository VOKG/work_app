import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  final String data1 = 'Email';
  final String email = 'Email.com';
  IconData iconemail =Icons.email;
  IconData icondpass =Icons.lock_outline;
  bool obscureText;

  final String password = 'Password ****';


  Widget _buildEmail(String data,String data2,IconData icondata){

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
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12),
              boxShadow:  [
                BoxShadow(
                  color: Colors.indigo,
                  offset: Offset.zero,
                  blurRadius: 8.0,
                  spreadRadius: 1.0,
                ),
              ]
          ),
          height: 60,
          child: TextField(
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:EdgeInsets.only(top: 14),
                prefixIcon: Icon(icondata,
                  color: Colors.white,
                ),
                hintText: data,
              )
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 120.0,
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
            SizedBox(height: 30.0,),
            _buildEmail(data1,email,iconemail),
            SizedBox(height: 30.0,),
            _buildEmail(password,password,icondpass),
            Container(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                onPressed: ()=>print('Forgot Password Button Pressed'),
                child: Text(
                  'Forgot Password',
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
