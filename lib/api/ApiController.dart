import 'package:dio/dio.dart';

class ApiController {
  Future<List<dynamic>> getdatas() async {
    final response =
        await Dio().get('https://reqres.in/api/users?page=1&per_page=10');

    final datas = response.data['data'];
    print(datas);
    return datas;
  }
}
