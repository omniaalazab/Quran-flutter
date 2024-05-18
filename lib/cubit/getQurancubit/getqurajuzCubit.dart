import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/Services/juzService.dart';

import 'package:quran_app/cubit/getQurancubit/getQuranState.dart';
import 'package:quran_app/cubit/getQurancubit/getjuzState.dart';
import 'package:quran_app/models/juz_Model.dart';

class GetQuranJuzCubit extends Cubit<QuranJuzState> {
  GetQuranJuzCubit() : super(QuranJuzInitialState());

  List<JuzModel> juzmodel = [];

  getJuzayahs({required int number}) async {
    try {
      emit(QuranJuzLoadingState());
      juzmodel = await QuranJuzServices(dio: Dio()).getEveryJuz(number);
      emit(QuranJuzSucessState(
        juzmodel: juzmodel,
      ));
    } on Exception catch (e) {
      log(e.toString());
      emit(QuranJuzErrorState(error: e.toString()));
    }
  }
}
