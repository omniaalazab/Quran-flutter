class JuzModel {
  int numberJuz;
  List<Ayahs> ayahs;
  JuzModel({
    required this.numberJuz,
    required this.ayahs,
  });
  factory JuzModel.fromJson(Map<String, dynamic> json) {
    List<Ayahs> ayahs = [];
    var list = json['ayahs'] as List;

    List<Ayahs> ayahlist = list.map((e) => Ayahs.fromJson(e)).toList();
    return JuzModel(
      numberJuz: json['number'],
      ayahs: ayahlist,
    );
    // numberJuz = json['number'];

    // if (json['ayahs'] != null) {
    //   ayahs = <Ayahs>[];
    //   json['ayahs'].forEach((e) {
    //     ayahs!.add(new Ayahs.fromJson(e));
    //   });
  }

  // List<Ayahs>ayahs=[];
  //     json["data"]['ayahs'].foreach(ayah){
  //       ayahs.add(ayah['text'],);
  //       ayahs.add(ayah['surah']['name']);};
  // return JuzModel(
  //   numberJuz: json["data"]['number'],
  //   ayahs: ayahs,
  // );
}

class Ayahs {
  String text;
  Surah surah;
  Ayahs({required this.text, required this.surah});

  factory Ayahs.fromJson(Map<String, dynamic> json) {
    return Ayahs(text: json['text'], surah: Surah.fromJson(json['surah']));
    // text = json['text'];
    // surah = json['surah'] != null ? new Surah.fromJson(json['surah']) : null;
  }
}

class Surah {
  String name;
  int numberOfAyahs;

  Surah({required this.name, required this.numberOfAyahs});

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(name: json['name'], numberOfAyahs: json['numberOfAyahs']);
  }
}
