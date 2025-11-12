import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {

  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    List <String> tasks=["Pray","Learn flutter","Check new Emails"];
    return
    Scaffold(
      appBar: AppBar(
        title: Center(
          child:  Text("My tasks and Notes"),
        )

      ),


      body:
      Column (
        children: [
          SizedBox(height: 300,
            child:
            ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10), // 20 pixels from left
                        child:  Text(tasks[index],style: TextStyle(color: Colors.black)),
                      )


                    ],
                  );


                }
            ),
          )


        ],
      )
      ,
      floatingActionButton:
      FloatingActionButton(onPressed:(){ context.goNamed('Screen2');},
      child:
        Icon(
          Icons.arrow_forward
        )
        ,),

    );




  }
}
