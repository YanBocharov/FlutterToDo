import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String? _userToDo;
  List todoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    todoList.addAll(['buy Milk', 'wash dishes', 'помыть посуду']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context , int index) {
            return Dismissible(
                key: Key(todoList[index]),
                child: Card(
                  child: ListTile(
                    title: Text(todoList[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_sweep),
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          todoList.removeAt(index);
                        });
                      },
                      iconSize: 25,
                    ),
                  ),
                ),
              onDismissed: (direction) {
                  // if(direction == DismissDirection.)
                setState(() {
                  todoList.removeAt(index);
                });
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Добавить элемент'),
              content: TextField(
                onChanged: (String value) {
                  _userToDo = value;
                },
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                  setState(() {
                    todoList.add(_userToDo);
                  });

                  Navigator.of(context).pop();
                },
                    child: Text('Добавить'),
                ),
              ],
            );
          });
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
