import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/Services/quranServices.dart';
import 'package:quran_app/cubit/getQurancubit/getQuranState.dart';
import 'package:quran_app/models/juz_Model.dart';
import 'package:quran_app/models/soura_Model.dart';

class GetQuranCubit extends Cubit<QuranState> {
  GetQuranCubit() : super(QuranInitialState());
  List<SouraModel> souramodel = [];

  getsoura() async {
    try {
      emit(QuranLoadingState());
      souramodel = await QuranServices(dio: Dio()).getEverySour();

      emit(QuranSucessState(souramodel: souramodel));
    } catch (e) {
      emit(QuranErrorState(error: e.toString()));
      log(e.toString());
    }
  }
}
