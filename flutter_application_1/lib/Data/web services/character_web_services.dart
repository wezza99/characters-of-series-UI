import 'package:dio/dio.dart';
import '../../constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions Options = BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(
        seconds: 20 * 1000,
      ),
      receiveTimeout: const Duration(
        seconds: 20 * 1000,
      ),
    );

    dio = Dio();
  }

  Future<List<dynamic>> getAllCharacters() async {
    print("start reading from api");
    try {
      Response response = await dio.get(
        "characters",
      ); // put url here
      //mfesh gded
      print(response.data.toString());
      print(response.statusCode);
      return response.data;
    } catch (e) {
      print("i catched error with status Code above ");
      print(e.toString());
      return [];
    }
  }
}
