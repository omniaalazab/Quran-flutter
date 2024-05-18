import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubit/getQurancubit/getSearchCubit.dart';

import 'package:quran_app/widget/CustomHeadText.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: CustomHeadText(
            text: 'البحث',
            Textsize: 20,
          ),
          foregroundColor: Colors.black,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchcontroller,
              onChanged: (value) {},
              onSubmitted: (value) async {
                var QuranSearchCubit =
                    await BlocProvider.of<GetSearchCubit>(context);
                QuranSearchCubit.getSearchedAyah(value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                hintText: 'ابحث هنا',
                label: CustomHeadText(
                  text: 'بحث',
                  Textsize: 20,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 131, 187, 156),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
