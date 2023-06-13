import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_mbank/home_page/core/cubit/exchange_rate_state.dart';
import 'package:test_mbank/home_page/core/repo/currency_repository.dart';

class CurrencyListBloc extends Cubit<CurrencyListState> {
  final List<String> baseCurrencies = ['USD', 'EUR', 'RUB'];
  final CurrencyRepository currencyRepository;

  CurrencyListBloc(this.currencyRepository) : super(CurrencyListInitial()) {
    fetchCurrencies(baseCurrencies[0]);
  }

  Future<void> fetchCurrencies(String currency) async {
    emit(CurrencyListLoading());

    try {
      final currencies = await currencyRepository.fetchCurrencies(currency);
      emit(CurrencyListLoaded(currencies, currency));
    } catch (error) {
      emit(CurrencyListError('Error fetching currencies: $error'));
    }
  }

  void selectBaseCurrency(String currency) {
    emit(CurrencyListLoading());
    fetchCurrencies(currency);
  }
}
