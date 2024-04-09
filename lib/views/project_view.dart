import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon/resource/colors.dart';
import 'package:hackathon/resource/images.dart';
import 'package:hackathon/views/project_controller.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProjectController projectController = Get.put(ProjectController());
    TextEditingController search_control = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: AppColors.secondary,
                  child: GestureDetector(
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.white,
                      ),
                      onTap: () {
                        Get.back();
                      })),
              const Text(
                "Project",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              CircleAvatar(
                  backgroundColor: AppColors.secondary,
                  child: GestureDetector(
                      child: const Icon(
                    Icons.add,
                    color: AppColors.white,
                  ))),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              child: TextField(
                controller: search_control,
                decoration: const InputDecoration(
                    fillColor: AppColors.secondary,
                    hintText: "Search Project Here",
                    hintStyle: TextStyle(
                      color: AppColors.grey,
                      fontSize: 16,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: AppColors.grey, width: 2),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 2),
                    ),
                    border: InputBorder.none,
                    filled: true,
                    labelText: 'Search',
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
            FutureBuilder(
                future: projectController.getAllTask(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ProjectTaskTile(
                            taskName: snapshot.data?[index].taskname,
                            taskDescription: snapshot.data?[index].data,
                            taskProgress: "50",
                            taskStartTime: snapshot.data?[index].starttime,
                            taskDeadline: snapshot.data?[index].endtime,
                            taskDate: snapshot.data?[index].starttime,
                          );
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })
          ])),
      backgroundColor: AppColors.secondary,
    );
  }
}

class ProjectTaskTile extends StatelessWidget {
  final String taskName;
  final String taskDescription;
  final String taskProgress;
  final String taskStartTime;
  final String taskDeadline;
  final String taskDate;
  const ProjectTaskTile(
      {required this.taskName,
      required this.taskDescription,
      required this.taskProgress,
      required this.taskStartTime,
      required this.taskDeadline,
      required this.taskDate,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey, width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(taskName,
                          style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Text(
                        taskDate,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    taskDescription,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(AppImages.People),
                      Spacer(),
                      Image.asset(
                        AppImages.Progressbar,
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
