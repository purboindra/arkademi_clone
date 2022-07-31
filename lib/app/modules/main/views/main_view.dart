import 'package:arkademi/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: Obx(() => controller.bodyMain[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: controller.bottomBarItem,
            currentIndex: controller.currentIndex.value,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey.shade400,
            onTap: (int index) => controller.onTap(index),
          )),
    );
  }
}
