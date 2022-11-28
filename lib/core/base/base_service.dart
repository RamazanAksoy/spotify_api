import 'dart:io';

import 'package:dio/dio.dart';
import 'package:spotify_api/core/constans/app.dart';
import 'base_model.dart';

class BaseService {
  Dio dio = Dio(BaseOptions(baseUrl: App.baseUrl, headers: App.requestHeaders));

  Future<dynamic> fetch<T extends IBaseModel>(String path,
      {IBaseModel? model, Map<String, dynamic>? queryParameters}) async {

    final response = await dio.get(path, queryParameters: queryParameters);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return _jsonBodyParser<T>(model!, response.data);
      default:
        throw response.data;
    }
  }

  dynamic _jsonBodyParser<T>(IBaseModel model, dynamic body) {
    if (body is List) {
      return body.map((e) => model.fromJson(e)).toList().cast<T>();
    } else if (body is Map) {
      return model.fromJson(body);
    } else {
      return body;
    }
  }
}
