import 'package:flutter/material.dart';
import 'package:hackathon/resource/icons.dart';
import 'package:hackathon/views/addTaskview.dart';
import 'package:hackathon/views/chat_view.dart';
import 'package:hackathon/views/home_view.dart';
import 'package:hackathon/views/profile_view.dart';
import 'package:hackathon/views/project_view.dart';
import '../../resource/colors.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  static const Screens = [
    HomeView(),
    ProjectView(),
    AddTaskView(),
    ChatView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens.elementAt(_currentIndex),
      bottomNavigationBar: Container(
        height: 80.0, // Adjust the height as needed
        color: Colors.black, // Set background color to black
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildNavItem(0, AppIcons.home),
            _buildNavItem(1, AppIcons.folder),
            _buildAddButton(),
            _buildNavItem(3, AppIcons.chat),
            _buildNavItem(4, AppIcons.hrofile),
          ],
        ),
      ),
      backgroundColor: AppColors.secondary,
    );
  }

  Widget _buildNavItem(int index, String iconPath) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Container(
        width: 56.0,
        height: 56.0,
        child: Image.asset(
          iconPath,
          color: (_currentIndex == index) ? AppColors.primary : AppColors.grey,
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () {
        _onItemTapped(2);
      },
      child: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
        ),
        child: Center(
          child: Image.asset(
            AppIcons.add,
            color: (_currentIndex == 2) ? AppColors.white : AppColors.white,
          ),
        ),
      ),
    );
  }
}
