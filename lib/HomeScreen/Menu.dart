import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_app/HomeScreen/card_menu.dart';
import 'package:work_app/constants/constants.dart';



class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];


  void delete(int index){
    itemsData.forEach((element) { });
  }


/////////////////////////////////////////
  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;

    List<Widget> listItems = [];

    responseList.forEach((k) {
      listItems.add(
        Container(
            height: 120,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.black87,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(100), blurRadius: 10.0),
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        k["name"],
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      Text(
                        k["brand"],
                        style:
                            const TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\$ ${k["price"]}",
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/images/${k["image"]}",
                    height: double.infinity,
                  )
                ],
              ),
            )),
      );
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {

    super.initState();

    getPostsData();

    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {

        topContainer = value;

        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return  SafeArea(
          child: Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                    Colors.black,
                    Colors.lightBlueAccent,
                  ],
                      stops: [
                    0.1,
                    22.0
                  ])),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Loyality Cards",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      RaisedButton(
                        onPressed: (){},
                        child:Text(
                          "Menu",
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  categoriesScroller,

                  /* AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer ? 0 : categoryHeight,
                    child: categoriesScroller),
              ),*/
                  Expanded(
                      child: ListView.builder(
                          controller: controller,
                          itemCount: itemsData.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            double scale = 1.0;
                            if (topContainer > 0.5) {
                              scale = index + 0.5 - topContainer;
                              if (scale < 0) {
                                scale = 0;
                              } else if (scale > 1) {
                                scale = 1;
                              }
                            }

                            return BlocBuilder(
                                builder: (context,state) {
                                  return InkWell(
                                   onTap: () {},
                                    child: Opacity(
                                      opacity: scale,
                                      child: Transform(
                                        transform: Matrix4.identity()
                                          ..scale(scale, scale),
                                        alignment: Alignment.bottomCenter,
                                        child: Align(
                                            heightFactor: 0.9,
                                            alignment: Alignment.topCenter,
                                            child: itemsData[index]),
                                      ),
                                    ),
                                  );
                                }
                            );
                          }
                          ),

                          ),
                ],
              ),
            ),
          ),
        );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.9 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
          child: FittedBox(
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
            child: Row(
              children: <Widget>[
                CardMenu(Colors.white10, "Super\nSaving"),
                CardMenu(Colors.white10, "Super\nSaving"),
                CardMenu(Colors.white10, "Newest"),
                CardMenu(Colors.white10, "Most\nFavorites"),
                CardMenu(Colors.white10, "Most\nFavorites"),
                CardMenu(Colors.white10, "Most\nFavorites"),
              ],
            ),
          )),
    );
  }
}
