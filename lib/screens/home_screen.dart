import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/database_helper.dart';

class Home extends StatefulWidget {
  final bool theme;
  final ValueChanged<bool> onThemeChanged;

  const Home({
    required this.theme,
    required this.onThemeChanged,
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Future<List<Map<String, dynamic>>> taskquery() async {
    return await database_helper.instance.getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("My tasks and Notes")),
      ),

      body: Column(
        children: [
          // ------------------- THEME SWITCH --------------------
          SwitchListTile(
            value: widget.theme,
            onChanged: widget.onThemeChanged,
            subtitle: const Text('Dark mode', textAlign: TextAlign.right),
          ),

          // ------------------- TASK LIST -----------------------
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: taskquery(),
              builder: (context, snapshot) {

                // Loading indicator while database is being read
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                // If something went wrong
                if (snapshot.hasError) {
                  return const Center(child: Text("Error loading tasks"));
                }

                // If empty
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No tasks available"));
                }

                final tasks = snapshot.data!;

                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                   //   leading: const Icon(Icons.task_alt),
                      title: Text(tasks[index]["title"] ?? "No title"),
                      subtitle: Text(tasks[index]["description"] ?? ""),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          int id = tasks[index]["id"];
                          await database_helper.instance.deleteTask(id);
                          setState(() {}); // refresh the list
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed('Screen2');
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
