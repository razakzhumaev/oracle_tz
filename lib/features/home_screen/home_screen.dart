import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_tz/features/chat/chat_screen.dart';
import 'package:oracle_tz/features/main/presentation/screens/main_screen.dart';
import 'package:oracle_tz/features/profile/profile_screen.dart';
import 'package:oracle_tz/features/search_screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = const [
    MainScreen(),
    SearchScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 32.h,
          left: 16.w,
          right: 16.w,
        ),
        child: screens[currentIndex],
      ),
    );
  }
}
