import 'package:quran_app/models/juz_Model.dart';

class SouraModel {
  int number;
  String name;
  String revelationType;

  List<Ayahs> ayahs;

  SouraModel(
      {required this.number,
      required this.name,
      required this.revelationType,
      required this.ayahs});
  factory SouraModel.fromJson(Map<String, dynamic> json) {
    List<Ayahs> ayahs = [];
    if (json['ayahs'] != null) {
      List<Ayahs>.from(
          json['ayahs'].map((ayahJson) => Ayahs.fromJson(ayahJson)));
    }
    return SouraModel(
      name: json["name"],
      number: json["number"],
      revelationType: json["revelationType"],
      ayahs: ayahs,
    );
  }
}

class Ayahs {
  int numberInSurah;
  String ayahsText;
  int juz;
  int hizbQuarter;
  int page;

  Ayahs({
    required this.page,
    required this.numberInSurah,
    required this.ayahsText,
    required this.juz,
    required this.hizbQuarter,
  });
  factory Ayahs.fromJson(Map<String, dynamic> json) {
    return Ayahs(
      page: json['page'],
      numberInSurah: json['numberInSurah'],
      ayahsText: json['ayahsText'],
      juz: json['juz'],
      hizbQuarter: json['hizbQuarter'],
    );
  }
}
