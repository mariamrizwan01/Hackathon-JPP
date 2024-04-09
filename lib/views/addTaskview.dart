import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon/views/widgets/CustomButton.dart';
import 'package:hackathon/views/widgets/CustomTextField.dart';
import '../../resource/colors.dart';
import 'task_controller.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController controller = Get.put(TaskController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Task Name",
                  style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 20)),
              CustomTextField(
                  title: "Task Name Here", controller: controller.taskName),
              const SizedBox(height: 20),
              const Text("Date",
                  style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 20)),
              CustomTextField(title: "Date Here", controller: controller.date),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Start Time",
                            style: TextStyle(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 20)),
                        CustomTextField(
                            title: "Start Time",
                            controller: controller.startTime),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("End Time",
                            style: TextStyle(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 20)),
                        CustomTextField(
                            title: "End Time", controller: controller.endTime),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Board",
                  style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 20)),
              //ChoiceChip For Selecting Board between URGENT,RUNNING,ONGOING
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                    () => ChoiceChip(
                      selectedColor: AppColors.primary2,
                      label: const Text("URGENT"),
                      selected: controller.isUrgent.value,
                      onSelected: (value) {
                        controller.isUrgent.value = value;
                        controller.isRunning.value = false;
                        controller.isOngoing.value = false;
                      },
                    ),
                  ),
                  Obx(
                    () => ChoiceChip(
                      selectedColor: AppColors.primary2,
                      label: const Text("RUNNING"),
                      selected: controller.isRunning.value,
                      onSelected: (value) {
                        controller.isRunning.value = value;
                        controller.isUrgent.value = false;
                        controller.isOngoing.value = false;
                      },
                    ),
                  ),
                  Obx(
                    () => ChoiceChip(
                      selectedColor: AppColors.primary2,
                      label: const Text("ONGOING"),
                      selected: controller.isOngoing.value,
                      onSelected: (value) {
                        controller.isOngoing.value = value;
                        controller.isRunning.value = false;
                        controller.isUrgent.value = false;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomButton(
                    title: "Save",
                    onPressed: () {
                      controller.addTask();
                    }),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.secondary,
    );
  }
}
