

import 'package:flutter/cupertino.dart';

@immutable
abstract class ModelState{
  const ModelState();
}

class AppInitialState extends ModelState{
  final Object indexState;
const AppInitialState(this.indexState);
}

class GlobalIndexState extends ModelState{
  final int indexState;

  const GlobalIndexState(this.indexState);

}