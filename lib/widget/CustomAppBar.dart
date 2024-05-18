import 'package:flutter/material.dart';
import 'package:quran_app/widget/CustomHeadText.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
      ),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      leading: Icon(Icons.arrow_back),
      backgroundColor: Color.fromARGB(255, 8, 92, 6),
    );
  }
}
