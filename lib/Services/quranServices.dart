import 'package:dio/dio.dart';
import 'package:quran_app/Core/constant.dart';
import 'package:quran_app/models/juz_Model.dart';
import 'package:quran_app/models/soura_Model.dart';

class QuranServices {
  Dio dio;
  QuranServices({required this.dio});
  Future<List<SouraModel>> getEverySour() async {
    Response response = await dio.get("$path/quran/quran-uthmani");
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> souras = jsonData['data']['surahs'];
    List<SouraModel> souraList = [];
    // SouraModel souramodel = SouraModel.fromJson(jsonData);
    for (var soura in souras) {
      SouraModel souraModel = SouraModel.fromJson(soura);
      print(souraModel.name);
      souraList.add(souraModel);
    }

    return souraList;
  }

  Future<List<SouraModel>> getSearchSour({required searchedAyah}) async {
    Response response = await dio.get(
        //https://api.alquran.cloud/v1/quran/quran-uthmani
        "$path/search/$searchedAyah/37/en.pickthall");
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> souras = jsonData['data']['surahs'];
    List<SouraModel> souraList = [];
    // SouraModel souramodel = SouraModel.fromJson(jsonData);
    for (var soura in souras) {
      SouraModel souraModel = SouraModel.fromJson(soura);

      souraList.add(souraModel);
    }

    return souraList;
  }
}
