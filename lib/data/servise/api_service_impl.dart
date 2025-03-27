import 'package:valyuta_app/data/remote/request/currency_request.dart';
import 'package:valyuta_app/data/servise/api_service.dart';
import 'package:dio/dio.dart';


class ApiServiceImpl extends ApiService {

  final _dio = Dio(BaseOptions(
      baseUrl: 'https://cbu.uz/uz',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      contentType: 'application/json'
  ));


  @override
  Future<List<CurrencyModel>> getCurrency() async {
    try {
      var result = await _dio.get('/arkhiv-kursov-valyut/json/');
      print("Data ${result.data.toString()}");
      return (result.data as List).map((response) =>
          CurrencyModel.fromJson(response)).toList();
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<CurrencyModel>> getCurrencyWithDay(String day) async {
    try {
      var result = await _dio.get(
          '/arkhiv-kursov-valyut/json/all/${day}/');
      return (result.data as List).map((response) =>
          CurrencyModel.fromJson(response)).toList();
    } on DioException {
      rethrow;
    }
  }}