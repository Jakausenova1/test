import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mbank/const/app_fonts.dart';
import 'package:test_mbank/home_page/core/cubit/exchange_rate_cubit.dart';
import 'package:test_mbank/home_page/core/cubit/exchange_rate_state.dart';
import 'package:test_mbank/home_page/model/currency_model.dart';
import 'package:test_mbank/home_page/ui/widgets/currency_detail.dart';

class CurrencyListScreen extends StatelessWidget {
  const CurrencyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CurrencyListBloc, CurrencyListState>(
        builder: (context, state) {
          if (state is CurrencyListInitial || state is CurrencyListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CurrencyListLoaded) {
            final currencies = state.currencies;
            return ListView.builder(
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                final currency = currencies[index];
                return ListTile(
                  title: Text(
                    currency.code,
                    style: AppFonts.w600s18,
                  ),
                  subtitle: Text(
                    'Курс: ${currency.rate.toStringAsFixed(2)}',
                    style: AppFonts.w400s16,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CurrencyDetailScreen(
                          baseCurrency: currencies[0].code,
                          targetCurrency: currency,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is CurrencyListError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: BlocBuilder<CurrencyListBloc, CurrencyListState>(
        builder: (context, state) {
          if (state is CurrencyListLoaded) {
            final filteredCurrencies = state.currencies
                .where(
                    (currency) => ['USD', 'EUR', 'RUB'].contains(currency.code))
                .toList();
            return DropdownButton<String>(
              value: state.selectedBaseCurrency,
              items: filteredCurrencies.map((CurrencyModel currency) {
                return DropdownMenuItem<String>(
                  value: currency.code,
                  child: Text(
                    currency.code,
                    style: AppFonts.w600s18,
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  BlocProvider.of<CurrencyListBloc>(context)
                      .selectBaseCurrency(value);
                }
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
