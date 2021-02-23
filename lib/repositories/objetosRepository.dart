import 'package:alugueai_mobile/pages/models/Object.dart';
import 'package:alugueai_mobile/utils/customDio.dart';

class ObjetoRepository {
  Future<List<ObjectModel>> findAll() {
    var dio = CustomDio().instance;
    return dio.get('https://alugueaimeu.herokuapp.com/objeto/').then((res) {
      return res.data.map<ObjectModel>((c) => ObjectModel.fromMap(c)).toList()
          as List<ObjectModel>;
    }).catchError((err) => print(err));
  }

  Future<List<ObjectModel>> findFilter(String nome) {
    var dio = CustomDio().instance;
    return dio
        .get('https://alugueaimeu.herokuapp.com/objeto/filtrar?nome=$nome')
        .then((res) {
      print(nome);
      return res.data.map<ObjectModel>((c) => ObjectModel.fromMap(c)).toList()
          as List<ObjectModel>;
    });
  }
}
