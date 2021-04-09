import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_app/singleton/stateSingleton.dart';

class SingletonExample extends StatefulWidget {
  SingletonExample({Key key}) : super(key: key);

  @override
  _SingletonExampleState createState() => _SingletonExampleState();
}

class _SingletonExampleState extends State<SingletonExample> {

 final List<ExampleStateBase> stateList = [
   ExampleState(),
   ExampleStateByDefinition.getState(),
   ExampleStateWithoutSingleton()
 ];

 void _setTextValues([String text = 'Singleton']){
   for (var state in stateList){
     state.setStateId(text);
   }
   setState(() {});
 }
 void _reset(){
   for(var state in stateList){
     state.reset();
   }
   setState(() {});
 }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(),
          child: Column(
            children:<Widget> [
              for(var state in stateList)
                Padding(
                    padding: const EdgeInsets.only(),
                  child: SingletonExample(

                  ),
                ),
              const SizedBox(),

            ],
          ),
        ),
      ),
    );
  }
}