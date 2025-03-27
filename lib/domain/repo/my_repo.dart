import 'package:dio/dio.dart';
import 'package:valyuta_app/data/remote/request/currency_request.dart';
import 'package:valyuta_app/data/servise/api_service_impl.dart';

class MyRepository {
  final api = ApiServiceImpl();
  Future<List<CurrencyModel>> getCurrency() {
    try {
      return api.getCurrency();
    } on DioException {
      rethrow;
    }
  }
  Future<List<CurrencyModel>> getCurrencyWithDay(String day) {
    try {
      return api.getCurrencyWithDay(day);
    } on DioException {
      rethrow;
    }
  }
}
