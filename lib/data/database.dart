import 'package:hive_flutter/hive_flutter.dart';
class ToDoDatabase{
  List toDoList=[];

  //reference the box
  final _myBox=Hive.box('mybox');
  //run this method if opening the app at first time
  void createInitialData(){
    toDoList=[
      ['hello world',false]
    ];
  }
  //load the data from the database
  void loadData()
  {
    toDoList=_myBox.get("TODOLIST");
  }
  //update the database
  void updateData()
  {
    _myBox.put("TODOLIST",toDoList);
  }
}