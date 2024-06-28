import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hohoedu_attendance/screens/home/home_screen.dart';

PreferredSizeWidget customAppbar(title) {
  return AppBar(
    backgroundColor: Colors.white, 
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, size: 35),
      onPressed: () {
        Get.off(const Home());
      },
    ),
    bottom: const PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Divider(
        height: 1.0,
        color: Color(0xffe4e1e1),
      ),
    ),
  );
}