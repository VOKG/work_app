

import 'package:scoped_model/scoped_model.dart';


class DataModel extends Model{

  int index=0;

  int get getIndex=> index;


  void changeInt (int newIndex){
     index =newIndex;
     notifyListeners();
   }

}