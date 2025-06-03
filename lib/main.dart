import 'package:flutter/material.dart';
import 'hive_service.dart';
import 'Pages/editing_assignments.dart';
import 'Pages/history.dart';
import 'Pages/statistics.dart';
import 'Generate_QR.dart'; // Import the new QR code generator page

void main() async {
  await HiveService.initHive(); // Initialize Hive using HiveService
  runApp(const TaskManagement());
}

class TaskManagement extends StatefulWidget {
  const TaskManagement({Key? key}) : super(key: key);

  @override
  State<TaskManagement> createState() => _TaskManagementState();
}

class _TaskManagementState extends State<TaskManagement> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _addToHistory(String task) {
    setState(() {
      HiveService.addToCompletedTasks(task);
    });
  }

  void _addTask(String task) {
    setState(() {
      HiveService.addTask(task);
    });
  }

  void _deleteTask(int index) {
    setState(() {
      HiveService.deleteTask(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      EditingAssignments(
        onTaskComplete: _addToHistory,
        tasks: HiveService.getTasks(),
        onAddTask: _addTask,
        onDeleteTask: _deleteTask,
      ),
      History(completedTasks: HiveService.getCompletedTasks()),
      Statistics(
        totalTasks: HiveService.getTasks().length +
            HiveService.getCompletedTasks().length,
        completedTasks: HiveService.getCompletedTasks().length,
        pendingTasks: HiveService.getTasks().length,
      ),
      QRCodeGenerator(), // Add the QR code generator page
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          selectedLabelStyle: TextStyle(color: Colors.black),
          unselectedLabelStyle: TextStyle(color: Colors.black54),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: 'Edit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Statistics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'QR Code',
            ),
          ],
        ),
      ),
    );
  }
}
