import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'hive_service.dart';

class QRCodeGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String data = _generateData();
    return Scaffold(
      appBar: AppBar(title: Text('Task QR Code')),
      body: Center(
        child: QrImageView(
          data: data,
          size: 200.0,
        ),
      ),
    );
  }

  String _generateData() {
    final tasks = HiveService.getTasks();
    final completedTasks = HiveService.getCompletedTasks();
    return '{"tasks": ${tasks.toString()}, "completedTasks": ${completedTasks.toString()}}';
  }
}
