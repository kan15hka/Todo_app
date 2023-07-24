import "package:flutter/material.dart";
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import "package:todo/util/todo_title.dart";
import "package:todo/util/dialog_box.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference to hive box
  final _myBox = Hive.box('mybox');
  ToDoDatabase db=ToDoDatabase();
  
  @override
  void initState() {
    // if first time opening app then create default data
    if (_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }
    else
    {
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();
  //Change CheckBox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }
  //Svenew task
  void saveNewTask()
  {
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }
  //Create New Task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: ()=>Navigator.of(context).pop(),
          );
        });
  }
  //delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 33, 59),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 1, 63, 107),
        title: Text(
          'TO DO',
          style: TextStyle(
            color: Color.fromARGB(255, 148, 187, 219),
            fontFamily: 'game',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 1, 63, 107),
        child: Icon(
          Icons.add,
          color: Color.fromARGB(255, 148, 187, 219),
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFuntion: (context)=>deleteTask(index),
          );
        },
      ),
    );
  }
}
