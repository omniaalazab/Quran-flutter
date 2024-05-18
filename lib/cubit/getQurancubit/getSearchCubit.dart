import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/Services/quranServices.dart';
import 'package:quran_app/cubit/getQurancubit/getQuranState.dart';
import 'package:quran_app/models/soura_Model.dart';

class GetSearchCubit extends Cubit<QuranState> {
  GetSearchCubit() : super(QuranInitialState());
  List<SouraModel> souramodel = [];
  getSearchedAyah(String Searchedword) async {
    try {
      souramodel = await QuranServices(dio: Dio())
          .getSearchSour(searchedAyah: Searchedword);

      emit(QuranSucessState(souramodel: souramodel));
    } catch (e) {
      emit(QuranErrorState(error: e.toString()));
    }
  }
}
