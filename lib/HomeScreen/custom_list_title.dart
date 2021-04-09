import 'package:flutter/material.dart';

class CustomListTitle extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTitle(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: InkWell(
        splashColor: Colors.orange,
        onTap: onTap,
        child: Container(
          height: 40,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Icon(icon,color: Colors.greenAccent,size: 20.0,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 20.0,color: Colors.greenAccent),
                      ),
                    )
                  ],
                ),
                Icon(Icons.arrow_right)
              ]),
        ),
      ),
    );
  }
}
