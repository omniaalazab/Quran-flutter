import 'package:flutter/material.dart';
import 'package:quran_app/widget/CustomHeadText.dart';

class CustomAyatOfSoura extends StatelessWidget {
  CustomAyatOfSoura({super.key, required this.name, required this.Ayat});
  String name;
  String Ayat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomHeadText(
          text: name,
          Textsize: 18,
          fontweight: FontWeight.bold,
        ),
        backgroundColor: Color.fromARGB(255, 8, 92, 6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          //scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Expanded(
                child: CustomHeadText(text: Ayat),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
