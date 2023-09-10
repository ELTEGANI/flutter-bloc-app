import 'package:dio/dio.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: "",
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: "application/json: charset=utf",
        responseType: ResponseType.json);
    dio = Dio(baseOptions);
  }

  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParams}) async {
    var response =
        await dio.post(path, data: data, queryParameters: queryParams);
    return response.data;
  }
}
