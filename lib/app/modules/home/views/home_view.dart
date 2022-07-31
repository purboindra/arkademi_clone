import 'package:arkademi/app/widgets/custom_width_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            categoryTop(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 140,
              width: Get.width,
              child: Stack(
                children: [
                  CarouselSlider(
                    carouselController: controller.carouselController,
                    items: controller.banner.map(
                      (e) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          width: Get.width,
                          height: 130,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("${e['image']}"),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "${e['name']}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        controller.currentIndex.value = index;
                      },
                      viewportFraction: 1,
                      // autoPlay: true,
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      autoPlayCurve: Curves.easeIn,
                      autoPlayInterval: Duration(seconds: 8),
                      height: 130,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Obx(() => Wrap(
                          spacing: 10,
                          alignment: WrapAlignment.center,
                          children: List.generate(
                            1,
                            (index) => DotsIndicator(
                              position:
                                  controller.currentIndex.value.toDouble(),
                              decorator: DotsDecorator(
                                activeColor: Colors.blue,
                                color: Colors.white,
                              ),
                              dotsCount: controller.banner.length,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: CustomWidthCard(),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Preparation Test",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
                            width: 150,
                            // height: 90,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Future.delayed(
      //       Duration.zero,
      //       () => Get.dialog(
      //         WillPopScope(
      //           child: Container(
      //             child: Center(
      //               child: CircularProgressIndicator(),
      //             ),
      //           ),
      //           onWillPop: () => Future.value(true),
      //         ),
      //         barrierDismissible: true,
      //         barrierColor: Colors.black45,
      //         useSafeArea: true,
      //       ),
      //     ).then((_) {
      //       return Future.delayed(Duration(seconds: 1), () {
      //         print('object');
      //         Get.back();
      //       });
      //     });
      //   },
      // ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 130),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 7.0,
              color: Colors.black.withOpacity(0.4),
            ),
          ],
        ),
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 140,
                      height: 40,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'LOGO',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.bell,
                          color: Colors.white,
                          size: 28,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          CupertinoIcons.heart,
                          color: Colors.white,
                          size: 28,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Cari kelas",
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox categoryTop() {
    final homeC = Get.find<HomeController>();
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        controller: homeC.scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: homeC.categoryTop.length,
        itemBuilder: (context, index) {
          return Obx(() => InkWell(
                onTap: () => homeC.changeCategory(index),
                child: Container(
                  margin: EdgeInsets.only(
                    right: 10,
                    top: 10,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5,
                  ),
                  // height: 30,
                  decoration: BoxDecoration(
                    color: homeC.currentCategory.value == index
                        ? Colors.blue
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.shade500,
                      style: homeC.currentCategory.value == index
                          ? BorderStyle.none
                          : BorderStyle.solid,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      controller.categoryTop[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: homeC.currentCategory.value == index
                            ? Colors.white
                            : Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
