abstract class ExampleStateBase{

  String stateId;
  String stateNumber;

  String get currentNumber=> stateId;

  void setStateId(String id)=> stateId = id;

  void reset() => stateId = stateNumber;


}


class ExampleStateByDefinition extends ExampleStateBase {

  static ExampleStateByDefinition _instance;

  ExampleStateByDefinition._internal(){
    stateNumber = "created ExampleStateByDefinition";
    stateId = stateNumber;
    print(stateId);
  }
  static ExampleStateByDefinition getState() {

    _instance ??= ExampleStateByDefinition._internal();

    return _instance;
  }

}


class ExampleState extends ExampleStateBase{
  static final ExampleState  _instance = ExampleState._internal();

  factory ExampleState(){
    return _instance;
  }

  ExampleState._internal(){

    stateNumber = "created ExampleState";
    stateId = stateNumber;
    print(stateId);
  }
}
class ExampleStateWithoutSingleton extends ExampleStateBase{
  ExampleStateWithoutSingleton(){
    stateNumber = "created ExampleStateWithoutSingleton";
    stateId = stateNumber;
    print(stateId);
  }
}
void main() {
var singl= ExampleStateWithoutSingleton();
print(singl.stateId);
print(singl.stateId);
}