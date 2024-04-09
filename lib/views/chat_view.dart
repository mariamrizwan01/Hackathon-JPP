import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon/views/chat_controller.dart';
import '../../resource/colors.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search_control = TextEditingController();
    ChatController chatController = Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
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
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                  border: InputBorder.none,
                  filled: true,
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: chatController.User.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        height: 100,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          border: Border.all(color: AppColors.grey, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                    chatController.User[index]['imageUrl']),
                              ),
                              title: Text(
                                chatController.User[index]['name'],
                                style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                chatController.User[index]['last'],
                                style: const TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: const Icon(
                                Icons.camera_alt,
                                color: AppColors.grey,
                              )),
                        )),
                  );
                }),
          )
        ],
      ),
      backgroundColor: AppColors.secondary,
    );
  }
}
