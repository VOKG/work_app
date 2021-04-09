import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardMenu extends StatelessWidget {
  Color color = Colors.blue.shade400;
  Color color2 = Colors.pink.shade400;
  Color color3 = Colors.blue.shade400;
  String text;

  CardMenu(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return Container(
        width: 150,
        margin: EdgeInsets.only(right: 20),
        height: categoryHeight,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [BoxShadow(
                color: Colors.black.withAlpha(120), blurRadius: 8.0),

  ]),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "20 Items",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
    );
  }
}
