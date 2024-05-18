import 'package:flutter/material.dart';
import 'package:quran_app/Screens/JuzDetails.dart';
import 'package:quran_app/models/juz_Model.dart';

import 'package:quran_app/widget/CustomHeadText.dart';

class CustomPartsListView extends StatelessWidget {
  CustomPartsListView({
    super.key,
    //required this.partsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => JuzDetails(selectedJuz: index)));
            },
            child: Card(
              child: Row(
                children: [
                  CustomHeadText(
                    text: "الجزء ${index + 1}",
                    Textsize: 20,
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 10,
                    color: Colors.blueGrey,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
