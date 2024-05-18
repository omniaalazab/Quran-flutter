import 'package:quran_app/models/soura_Model.dart';

class QuranState {}

class QuranInitialState extends QuranState {}

class QuranSucessState extends QuranState {
  List<SouraModel> souramodel;
  QuranSucessState({required this.souramodel});
}

class QuranErrorState extends QuranState {
  final String error;

  QuranErrorState({required this.error});
}

class QuranLoadingState extends QuranState {}
