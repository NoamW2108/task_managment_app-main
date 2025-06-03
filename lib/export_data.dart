import 'dart:io';
import 'package:excel/excel.dart';

void exportDataToExcel(List<String> tasks, List<String> completedTasks) {
  var excel = Excel.createExcel();

  Sheet sheet = excel['Sheet1'];

  sheet.appendRow(['Pending Tasks']);
  for (String task in tasks) {
    sheet.appendRow([task]);
  }

  sheet.appendRow([]);
  sheet.appendRow(['Completed Tasks']);
  for (String completedTask in completedTasks) {
    sheet.appendRow([completedTask]);
  }

  var fileBytes = excel.save();
  File("task_data.xlsx")
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!);

  print('Data exported to task_data.xlsx');
}
