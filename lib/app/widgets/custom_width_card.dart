import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomWidthCard extends StatelessWidget {
  const CustomWidthCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Container(
        width: Get.width,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
