import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  final int totalTasks;
  final int completedTasks;
  final int pendingTasks;

  const Statistics({
    Key? key,
    required this.totalTasks,
    required this.completedTasks,
    required this.pendingTasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
        backgroundColor: const Color.fromARGB(255, 100, 100, 200),
      ),
      body: Container(
        color: const Color.fromARGB(255, 173, 216, 230),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tasks Left to Perform: $pendingTasks',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                'Tasks Performed: $completedTasks',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                'Total Tasks Created: $totalTasks',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
