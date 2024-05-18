import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/Screens/SouraDetails.dart';
import 'package:quran_app/Services/quranServices.dart';
import 'package:quran_app/cubit/getQurancubit/getQuranState.dart';
import 'package:quran_app/cubit/getQurancubit/getqurajuzCubit.dart';
import 'package:quran_app/cubit/getQurancubit/getquranCubit.dart';
import 'package:quran_app/models/soura_Model.dart';
import 'package:quran_app/widget/CustomHeadText.dart';
import 'package:dio/dio.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  void initState() {
    getJuzAyahDetails();
    super.initState();
  }

  getJuzAyahDetails() {
    BlocProvider.of<GetQuranCubit>(context).getsoura();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetQuranCubit, QuranState>(
      builder: (context, state) {
        if (state is QuranSucessState) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.souramodel.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                SouraDetails(selectedSoura: index)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        CustomHeadText(
                          text: state.souramodel[index].number.toString(),
                          Textsize: 20,
                        ),
                        SizedBox(width: 30),
                        CustomHeadText(
                          text: state.souramodel[index].name,
                          Textsize: 20,
                        ),
                        SizedBox(width: 30),
                        CustomHeadText(
                          text: state.souramodel[index].revelationType,
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
        } else if (state is QuranErrorState) {
          return Center(
              child: (CustomHeadText(
            text: 'There is error , Try Later',
            Textsize: 30,
          )));
        } else if (state is QuranLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(
              child: (CustomHeadText(
            text: 'please try again',
            Textsize: 30,
          )));
        }
      },
    );
  }
}
