import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubit/getQurancubit/getQuranState.dart';
import 'package:quran_app/cubit/getQurancubit/getjuzState.dart';
import 'package:quran_app/cubit/getQurancubit/getqurajuzCubit.dart';
import 'package:quran_app/cubit/getQurancubit/getquranCubit.dart';
import 'package:quran_app/models/juz_Model.dart';
import 'package:quran_app/widget/CustomAyatOfJuz.dart';
import 'package:quran_app/widget/CustomHeadText.dart';

class JuzDetails extends StatefulWidget {
  JuzDetails({super.key, required this.selectedJuz});
  int selectedJuz;

  @override
  State<JuzDetails> createState() => _JuzDetailsState();
}

class _JuzDetailsState extends State<JuzDetails> {
  @override

//   SouraDetails({super.key, required this.selectedSoura});
  void initState() {
    getJuzAyahDetails();
    super.initState();
  }

  getJuzAyahDetails() {
    BlocProvider.of<GetQuranJuzCubit>(context)
        .getJuzayahs(number: widget.selectedJuz);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetQuranJuzCubit, QuranJuzState>(
      builder: (context, state) {
        if (state is QuranJuzSucessState) {
          return Expanded(
              child: ListView.builder(
                  itemCount: state.juzmodel[widget.selectedJuz].ayahs.length,
                  itemBuilder: (context, index) {
                    return CustomAyatOfJuz(
                      numberJuz: state.juzmodel[widget.selectedJuz].numberJuz,
                      AyahText:
                          state.juzmodel[widget.selectedJuz].ayahs[index].text!,
                    );
                  }));
        } else if (state is QuranJuzErrorState) {
          return Scaffold(
              body: Center(
                  child: (CustomHeadText(
            text: 'There is error , Try Later',
            Textsize: 30,
          ))));
        } else if (state is QuranJuzLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
              body: Center(
                  child: (CustomHeadText(
            text: 'please try again',
            Textsize: 30,
          ))));
        }
      },
    );
  }
}
