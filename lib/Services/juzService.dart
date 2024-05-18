import 'package:dio/dio.dart';
import 'package:quran_app/Core/constant.dart';
import 'package:quran_app/models/juz_Model.dart';

class QuranJuzServices {
  Dio dio;
  QuranJuzServices({required this.dio});

  Future<List<JuzModel>> getEveryJuz(int nojuz) async {
    Response response = await dio.get("$path/juz/$nojuz/quran-uthmani");
    //https://api.alquran.cloud/v1/juz/30/quran-uthmani
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> Juzs = jsonData['data'];
    List<JuzModel> juzList = [];
    try {
      for (var juz in Juzs) {
        JuzModel juzModel = JuzModel.fromJson(juz);
        print(juzModel.numberJuz);
        juzList.add(juzModel);
      }
      return juzList;
    } on DioException catch (e) {
      String errormsg = e.response?.data['error']['message'] ??
          'There is Error,try again Later...';

      throw Exception(errormsg);
    } catch (e) {
      //log(e.toString());
      print(e.toString());
      throw Exception('There is error,try again');
    }
  }
}
