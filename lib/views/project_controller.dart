import 'dart:developer';
import 'package:get/get.dart';
import 'package:hackathon/services/api_client.dart';
import '../../models/user_model.dart';
import 'package:hackathon/utils/shared_perf.dart';

class ProjectController extends GetxController {
  ApiClient apiClient = ApiClient();
  //"65b658012c8177e35c41e2e3"
  var tasks = <Tasks>[].obs;
  Future<List> getAllTask() async {
    log("getAllTask");
    String id = await SharedPref.readValue('id');
    log(id);
    try {
      tasks.value = await apiClient.getTasks(id);
      log(tasks.toString() + "tasks");
      return tasks;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static void project() {}
}
