import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:task_notes_manager/models/TaskItem.dart';
import 'package:task_notes_manager/services/database_helper.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _formKey = GlobalKey<FormBuilderState>();
  List<dynamic> items=['low','average','high'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:Text("Customize your tasks")
        ),
      ),
      body: Center(
        child:FormBuilder(
          key: _formKey,
          child:  Column(
            children: [
              Text("Create New Task",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue
                ),

              ),

              SizedBox(width: 300,
                child: FormBuilderTextField(
                  name: 'title',
                  decoration: InputDecoration(
                    labelText: "Task title",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              SizedBox(height:20),
              SizedBox(
                width: 300,
                child: FormBuilderDropdown(name: 'priority',
                    decoration: InputDecoration(
                        labelText: "Priority",
                        border: OutlineInputBorder()
                    ),
                    items:
                [DropdownMenuItem(value: 'High', child: Text('High')),
                DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                DropdownMenuItem(value: 'Low', child: Text('Low')),
                            ]
                ),
              ),
              SizedBox(height: 20,),

              SizedBox(width: 300,
                child: FormBuilderTextField(
                  name: 'description',
                  maxLines: 3,
                  decoration: InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder()
                  ),
                ),
              )
              ,SizedBox(height: 20,),
              ElevatedButton(onPressed: () async {
                if (_formKey.currentState!.saveAndValidate()) {
                  final data = _formKey.currentState!.value;
                  print(data);
                  Taskitem task=Taskitem(data['title'],data['priority'], data['description']);
                print("After converting to object");
                 print(task.toJson());
                  _formKey.currentState!.reset(); // clear inputs

                  int id=await database_helper.instance.insertTask(task);
                  if(id>0){
                    print("Object inserted:id{$id}");
                  }


                }


              }, child: Text('ADD TASK'))
            ],
          ),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,

      floatingActionButton: FloatingActionButton(onPressed: (){

        context.goNamed('home');

      },
      child: Icon(Icons.arrow_back),),
    );
  }
}
