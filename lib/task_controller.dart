import 'package:get/get.dart';
import 'package:profile/db/db_helper.dart';
import 'task.dart';

class TaskController extends GetxController {
  @override
  void onRead() {
    getTasks();
    super.onReady();
  }

  var taskList = <Task>[].obs;
  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  // nhaanj taats car du lieu tu bangr

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }
}

//   void getTasks() async {
//     List<Map<String, dynamic>> tasks = await DBHelper.query();
//     taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
//   }
// }

