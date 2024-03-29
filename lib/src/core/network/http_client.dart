import 'package:dio/dio.dart';
import 'package:nyntax_car/src/core/utils/constants.dart';

class BaseHttpClient {
  late final Dio _client;
  static final BaseHttpClient _instance = BaseHttpClient._internal();

  factory BaseHttpClient() => _instance;

  BaseHttpClient._internal() {
    _client = Dio()
      ..options.baseUrl = AppConstants.baseUrl
      ..options.headers = {'Accept': 'application/json'};
  }

  Dio get client => _client;
}
