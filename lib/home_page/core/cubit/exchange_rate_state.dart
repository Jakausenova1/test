import 'package:test_mbank/home_page/model/currency_model.dart';

abstract class CurrencyListState {}

class CurrencyListInitial extends CurrencyListState {}

class CurrencyListLoading extends CurrencyListState {}

class CurrencyListLoaded extends CurrencyListState {
  final List<CurrencyModel> currencies;
  final String selectedBaseCurrency;

  CurrencyListLoaded(this.currencies, this.selectedBaseCurrency);
}

class CurrencyListError extends CurrencyListState {
  final String errorMessage = 'ошибка';

  CurrencyListError(errorMessage);
}
