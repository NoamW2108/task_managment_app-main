import 'package:flutter/material.dart';

class History extends StatelessWidget {
  final List<String> completedTasks;

  const History({Key? key, required this.completedTasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: const Color.fromARGB(255, 100, 100, 200),
      ),
      body: Container(
        color: const Color.fromARGB(255, 173, 216, 230),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: completedTasks.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(completedTasks[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
