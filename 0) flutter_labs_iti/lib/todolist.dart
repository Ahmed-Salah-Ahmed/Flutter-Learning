import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<TodoItem> _todoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _todoItems.length,
              itemBuilder: (BuildContext context, int index) {
                return TodoListItem(
                  todoItem: _todoItems[index],
                  onChanged: (value) {
                    setState(() {
                      _todoItems[index].isDone = value!;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter todo item',
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  final errorMessage = validateTodoItem(value);
                  if (errorMessage == null) {
                    setState(() {
                      _todoItems.add(TodoItem(title: value, isDone: false));
                    });
                    _textEditingController.clear();
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Invalid input'),
                        content: Text(errorMessage),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                }
              },
            )
          ),
          ElevatedButton(
            child: Text('Show Done Items'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DoneTasksScreen(todoItems: _todoItems)));
            },
          ),
        ],
      ),
    );
  }

  String? validateTodoItem(String value) {
    if (value.isEmpty) {
      return 'Please enter a todo item';
    }
    if (_todoItems.any((item) => item.title == value)) {
      return 'This todo item already exists';
    }
    return null;
  }
}

class TodoItem {
  final String title;
  bool isDone;

  TodoItem({required this.title, required this.isDone});
}

class TodoListItem extends StatelessWidget {
  final TodoItem todoItem;
  final Function(bool?) onChanged;

  const TodoListItem({Key? key, required this.todoItem, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todoItem.isDone,
        onChanged: onChanged,
      ),
      title: Text(todoItem.title),
    );
  }
}

class DoneTasksScreen extends StatelessWidget {
  final List<TodoItem> todoItems;

  const DoneTasksScreen({Key? key, required this.todoItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doneItems = todoItems.where((item) => item.isDone).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Done Tasks'),
      ),
      body: ListView.builder(
        itemCount: doneItems.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoListItem(
            todoItem: doneItems[index],
            onChanged: (value) {},
          );
        },
      ),
    );
  }
}
