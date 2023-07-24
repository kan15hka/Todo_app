import "package:flutter/material.dart";
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFuntion;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFuntion
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFuntion,
              icon: Icons.delete,
              backgroundColor: Color.fromARGB(255, 119, 180, 230),
              borderRadius: BorderRadius.circular(12.0),
            )
            ]),
        child: Container(
            padding: EdgeInsets.all(25.0),
            child: Row(children: [
              //CheckBox
              Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  activeColor: Color.fromARGB(255, 9, 25, 36),
                  checkColor: Color.fromARGB(255, 148, 187, 219),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => BorderSide(
                        width: 2.0, color: Color.fromARGB(255, 148, 187, 219)),
                  )),
              //Task Name
      
              Text(
                taskName,
                style: TextStyle(
                  color: Color.fromARGB(255, 148, 187, 219),
                  fontFamily: 'game',
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: 3.5,
                ),
              ),
            ]),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 1, 63, 107),
              borderRadius: BorderRadius.circular(12.0),
            )),
      ),
    );
  }
}
