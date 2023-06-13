import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mbank/home_page/core/cubit/exchange_rate_cubit.dart';
import 'package:test_mbank/home_page/core/repo/currency_repository.dart';
import 'package:test_mbank/home_page/ui/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CurrencyListBloc(CurrencyRepository()),
        child: const CurrencyListScreen(),
      ),
    );
  }
}
