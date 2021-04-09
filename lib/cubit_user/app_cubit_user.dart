import 'package:bloc/bloc.dart';
import 'package:work_app/cubit_state/app_state_model.dart';

class AppCubit extends Cubit<ModelState>{


  AppCubit(): super(AppInitialState(0));

  // ignore: missing_return
  int setIndex(int i){
    emit(GlobalIndexState(i));

  }

 void get getIndex => emit(AppInitialState(state));

}