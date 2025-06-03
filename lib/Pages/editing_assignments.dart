import 'package:flutter/material.dart';

class EditingAssignments extends StatefulWidget {
  final Function(String) onTaskComplete;
  final List<String> tasks;
  final Function(String) onAddTask;
  final Function(int) onDeleteTask;

  const EditingAssignments({
    Key? key,
    required this.onTaskComplete,
    required this.tasks,
    required this.onAddTask,
    required this.onDeleteTask,
  }) : super(key: key);

  @override
  _EditingAssignmentsState createState() => _EditingAssignmentsState();
}

class _EditingAssignmentsState extends State<EditingAssignments> {
  final TextEditingController _taskController = TextEditingController();

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      widget.onAddTask(_taskController.text);
      _taskController.clear();
    }
  }

  void _deleteTask(int index) {
    widget.onDeleteTask(index);
  }

  void _completeTask(int index) {
    widget.onTaskComplete(widget.tasks[index]);
    _deleteTask(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editing Assignments'),
        backgroundColor: const Color.fromARGB(255, 100, 100, 200),
      ),
      body: Container(
        color: const Color.fromARGB(255, 173, 216, 230),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _taskController,
                      decoration: const InputDecoration(
                        labelText: 'New Task',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _addTask,
                    child: const Text('Add'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 100, 100, 200),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.tasks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(widget.tasks[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.check),
                              onPressed: () => _completeTask(index),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _deleteTask(index),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
