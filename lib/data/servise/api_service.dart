import 'package:valyuta_app/data/remote/request/currency_request.dart';

abstract class ApiService {
  Future<List<CurrencyModel>> getCurrency();
  Future<List<CurrencyModel>> getCurrencyWithDay(String day);
}
