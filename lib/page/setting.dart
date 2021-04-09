import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:work_app/controllers/view_setting_controller.dart';

class Setting extends StatelessWidget {

  final ViewSettingController controller = Get.put(ViewSettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration:BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors:<Color>
                  [
                    Colors.black,
                    Colors.greenAccent,
                  ],
                  stops: [0.1,22.0]
              )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Obx(()=>Text(  '${controller.count.value}',
                  style: Theme.of(context).textTheme.headline4,)),
                FloatingActionButton(
                  onPressed: controller.decrement,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                )

              ],
            ),
          ),

        ),
            floatingActionButton: FloatingActionButton(
       onPressed: controller.increment,
              tooltip: 'Increment',
              child: Icon(Icons.add),
    ),


    );
  }
}
