import 'package:flutter/material.dart';
import 'package:todo_test/widgets/counter.dart';
import 'package:todo_test/widgets/todo_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

// class for task(todo-card)
class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

class _TodoAppState extends State<TodoApp> {
  // list of todos
  List allTasks = [
    Task(title: "Publish video", status: true),
    Task(title: "Laugh louder", status: true),
    Task(title: "GEM", status: false),
  ];

  // To remove todo  when clicking on "delete" icon
  delete(clickedTask) {
    setState(() {
      allTasks.remove(allTasks[clickedTask]);
    });
  }

  // To remove all todos  when clicking on "delete" icon in the appBar
  deleteAll() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

  // To change the state of the todo (completed or not completed) when click on the todo
  changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    });
  }

// Create controller to  get the text inside the textfield  in the dialog widget
  final myController = TextEditingController();


 // To calculate only completed todos
  int calcCompletetTaske() {
    int completedTasks = 0;
    allTasks.forEach((element) {
      if (element.status) {
        completedTasks++;
      }
    });
    return completedTasks;
  }

// To add new todo when clicking on "ADD" in the dialog widget
  addNewTask() {
    setState(() {
      allTasks.add(Task(title: myController.text, status: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: EdgeInsets.all(22),
                  height: 200,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: myController,
                          maxLength: 20,
                          decoration: InputDecoration(
                            hintText: 'Add new task',
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        TextButton(
                          onPressed: () {
                            addNewTask();
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ]),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              deleteAll();
            },
            icon: Icon(
              Icons.delete_forever,
            ),
            color: Color.fromARGB(255, 224, 140, 134),
            iconSize: 34,
          ),
        ],
        elevation: 0,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text(
          'To Do App',
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Counter(
              allToDo: allTasks.length,
              allCompleted: calcCompletetTaske(),
            ),
            Container(
              margin: EdgeInsets.only(top: 22),
              height: 550,
              color: Color.fromARGB(255, 55, 63, 82),
              child: ListView.builder(
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TodoCard(
                      vartitle: allTasks[index].title,
                      doneOrnot: allTasks[index].status,
                      changeStatus: changeStatus,
                      index: index,
                      delete: delete,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
