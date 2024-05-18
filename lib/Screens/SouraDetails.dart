// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran_app/cubit/getQurancubit/getQuranState.dart';
import 'package:quran_app/cubit/getQurancubit/getquranCubit.dart';
import 'package:quran_app/models/soura_Model.dart';
import 'package:quran_app/widget/CustomHeadText.dart';
import 'package:quran_app/widget/Custom_Ayat_of_Soura.dart';

class SouraDetails extends StatefulWidget {
  SouraDetails({super.key, required this.selectedSoura});

  int selectedSoura;

  @override
  State<SouraDetails> createState() => _SouraDetailsState();
}

class _SouraDetailsState extends State<SouraDetails> {
  @override
  void initState() {
    getJuzAyahDetails();
    super.initState();
  }

  getJuzAyahDetails() {
    BlocProvider.of<GetQuranCubit>(context).getsoura();
  }
//   SouraDetails({super.key, required this.selectedSoura});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetQuranCubit, QuranState>(
      builder: (context, state) {
        if (state is QuranSucessState) {
          return Expanded(
              child: ListView.builder(
                  itemCount: state.souramodel.length,
                  itemBuilder: (context, index) {
                    return CustomAyatOfSoura(
                      name: state.souramodel[widget.selectedSoura].name,
                      Ayat: state.souramodel[widget.selectedSoura].ayahs[index]
                          .ayahsText,
                    );
                  }));
        } else if (state is QuranErrorState) {
          return Center(
            child: CustomHeadText(
              text: 'There is error , Try Later',
              Textsize: 30,
            ),
          );
        } else if (state is QuranLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: CustomHeadText(
              text: 'please try again',
              Textsize: 30,
            ),
          );
        }
      },
    );
  }
}
