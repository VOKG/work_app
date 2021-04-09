import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:work_app/constants/constants.dart';
import 'package:work_app/cubit_user/app_cubit_user.dart';
import 'package:work_app/data/data.dart';

class Cards extends StatelessWidget {

  List<Widget> itemsData = [];


 tapController(int index){
    var a = itemsData[index];
    return a;
  }


  Widget getPostsData(int index) {
    List<dynamic> responseList = FOOD_DATA;

    List<Widget> listItems = [];

    responseList.forEach((post) {
      listItems.add( Container(
          height: 400,
          width: 400,
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold,
                        color: Colors.red
                      ),
                    ),
                    Text(
                      post["brand"],
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Checkbox(
                        value: true,
                        focusColor: Colors.greenAccent,
                        hoverColor: Colors.orange,
                        checkColor: Colors.red,
                        activeColor: Colors.white,
                        onChanged: (value){
                        }
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      "\$ ${post["price"]}",
                      style: const TextStyle(
                          fontSize: 45,
                          color:  Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),

                Center(
                  child: Image.asset(
                    "assets/images/${post["image"]}",
                    height: 150,
                  ),
                ),


              ],
            ),
          )),
      );
    });
    itemsData = listItems;
    var cardShow = itemsData[0];
    return cardShow;
    }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:  Colors.black,
      body: Card(
        color:  Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:0, vertical: 20),
        child: Column(
          children:<Widget> [
           // getPostsData(context.read<AppCubit>());
            /*ScopedModelDescendant<DataModel>(
                builder: (context,child,model){
                  return getPostsData(model.index);
                },
            ),*/


          ],
        ),
      )
      ),
    );
        }

  }




class DemoCard extends StatelessWidget {
  List function;
  DemoCard({this.function});


  @override
  Widget build(BuildContext context) {

    return Scaffold();
  }
}