import 'package:flutter/material.dart';

PreferredSizeWidget customAppbar(title) {
  return AppBar(
    backgroundColor: Colors.transparent, 
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold),),
    centerTitle: true,
    bottom: const PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Divider(
        height: 1.0,
        color: Color(0xffe4e1e1),
      ),
    ),
  );
}