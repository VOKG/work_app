import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_app/CardDetail/CardListTile.dart';

class CardDetail{
  String title;
  String subtitle;
  CardDetail({this.subtitle,this.title});
}
List<CardDetail> cards = [
  CardDetail(title: 'Map', subtitle: 'Basic'),
  CardDetail(title: 'Set', subtitle: 'Basic')
];

final List<CardDetail> newCards = [
  CardDetail(title: 'NEW', subtitle: 'NEW'),
];

class DashBoard extends StatefulWidget{
  @override
  _DashBoardState createState()=> _DashBoardState();

}
class _DashBoardState extends State<DashBoard>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),

      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) => CardListTile(
                title: cards[index].title,
                subtitle: cards[index].subtitle,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Add Card'),
                  onPressed: () {
                    //TODO: Add a new card to cards with title 'Unit Testing' and subtitle of 'Intermediate'.
                   // cards.add(CardDetail(title: 'Unit Testing', subtitle: 'Intermediate'));
                    cards=[...cards,... newCards];
                    setState(() {});
                  },
                ),
                ElevatedButton(
                  child: Text('Clear All'),
                  onPressed: () {
                    //TODO: Shuffle all cards and change the order of them in the UI
                    cards.clear();
                    setState(() {});
                  },
                ),
                ElevatedButton(
                  child: Text('Delete'),
                  onPressed: () {
                    //TODO: Shuffle all cards and change the order of them in the UI
                    cards.removeLast();
                    setState(() {});
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
