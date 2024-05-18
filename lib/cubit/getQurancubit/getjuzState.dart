import 'package:quran_app/models/juz_Model.dart';

class QuranJuzState {}

class QuranJuzInitialState extends QuranJuzState {}

class QuranJuzSucessState extends QuranJuzState {
  List<JuzModel> juzmodel;

  QuranJuzSucessState({required this.juzmodel});
}

class QuranJuzErrorState extends QuranJuzState {
  final String error;

  QuranJuzErrorState({required this.error});
}

class QuranJuzLoadingState extends QuranJuzState {}
