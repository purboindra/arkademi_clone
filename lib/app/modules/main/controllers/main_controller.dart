import 'package:arkademi/app/modules/home/controllers/home_controller.dart';
import 'package:arkademi/app/modules/home/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;

  List<Widget> bodyMain = [
    HomeView(),
    Center(
      child: Text("data"),
    ),
    Center(
      child: Text("data"),
    ),
    Center(
      child: Text("data"),
    ),
  ];

  List<BottomNavigationBarItem> bottomBarItem = [
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.home,
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.chart_bar,
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.history,
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.profile_circled,
      ),
      label: "Home",
    ),
  ];

  void onTap(int index) {
    currentIndex.value = index;
  }
}
