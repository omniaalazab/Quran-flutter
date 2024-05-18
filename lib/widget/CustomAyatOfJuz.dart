import 'package:flutter/material.dart';
import 'package:quran_app/widget/CustomHeadText.dart';

class CustomAyatOfJuz extends StatelessWidget {
  CustomAyatOfJuz({super.key, required this.numberJuz, required this.AyahText});
  int numberJuz;
  String AyahText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomHeadText(
          text: numberJuz.toString(),
          Textsize: 18,
          fontweight: FontWeight.bold,
        ),
        backgroundColor: Color.fromARGB(255, 8, 92, 6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Expanded(
                child: CustomHeadText(text: AyahText),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
