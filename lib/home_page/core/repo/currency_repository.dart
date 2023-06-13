import 'package:dio/dio.dart';
import 'package:test_mbank/home_page/model/currency_model.dart';

class CurrencyRepository {
  // final Dio _dio;
  // CurrencyRepository({required Dio dio}) : _dio = dio;

  Future<List<CurrencyModel>> fetchCurrencies(String baseCurrency) async {
    try {
      final response = await Dio()
          .get('https://api.exchangerate.host/latest?base=$baseCurrency');
      final data = response.data;
      final rates = data['rates'] as Map<String, dynamic>;
      final currencies = rates.entries
          .map((entry) =>
              CurrencyModel(code: entry.key, rate: entry.value.toDouble()))
          .toList();
      return currencies;
    } catch (error) {
      throw Exception('errrrrrrrrrrr##: $error');
    }
  }
}


//сделать юрл в конст
