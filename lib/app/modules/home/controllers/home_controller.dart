import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> categoryTop = [
    'KUPON',
    'Bisnis',
    'Keuangan',
    'Pengembangan Karir',
    'Sertifikasi',
    'Teknologi',
    'Hobi',
    'Bahasa',
  ];

  List<Map<String, String>> banner = [
    {
      "name": "Diskon",
      "image":
          "https://images.unsplash.com/photo-1534951009808-766178b47a4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGRpc2NvdW50fGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "Promo Sat Set Sat Set",
      "image":
          "https://images.unsplash.com/photo-1627719172031-ab42dc849bc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDB8fGRpc2NvdW50fGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
    },
    {
      "name": "Dapatkan Point",
      "image":
          "https://images.unsplash.com/photo-1606207963463-5836a7c211fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGNhc2glMjBiYWNrfGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
    },
  ];

  RxInt currentCategory = 0.obs;

  RxInt currentIndex = 0.obs;
  final CarouselController carouselController = CarouselController();

  ScrollController scrollController = ScrollController();

  void changeCategory(int index) {
    currentCategory.value = index;
  }

  void scrollList() {
    scrollController = ScrollController(initialScrollOffset: 0.0)
      ..addListener(() {
        if (scrollController.offset >=
            scrollController.position.minScrollExtent) {}
      });
  }

  @override
  void onInit() {
    scrollList();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
