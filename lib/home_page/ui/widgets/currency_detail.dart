import 'package:flutter/material.dart';
import 'package:test_mbank/const/app_colors.dart';
import 'package:test_mbank/const/app_fonts.dart';
import 'package:test_mbank/home_page/model/currency_model.dart';

class CurrencyDetailScreen extends StatefulWidget {
  final String baseCurrency;
  final CurrencyModel targetCurrency;

  const CurrencyDetailScreen({
    super.key,
    required this.baseCurrency,
    required this.targetCurrency,
  });

  @override
  CurrencyDetailScreenState createState() => CurrencyDetailScreenState();
}

class CurrencyDetailScreenState extends State<CurrencyDetailScreen> {
  late double amount;

  @override
  void initState() {
    super.initState();
    amount = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    final convertedAmount = widget.targetCurrency.rate * amount;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        title: Text(widget.targetCurrency.code),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Валюта: ${widget.baseCurrency}',
              style: AppFonts.w600s18,
            ),
            Text(
              'Курс: ${widget.targetCurrency.rate.toStringAsFixed(2)}',
              style: AppFonts.w400s16,
            ),
            const SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  amount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Text(
              'Итого: ${convertedAmount.toStringAsFixed(2)}',
              style: AppFonts.w600s18,
            ),
          ],
        ),
      ),
    );
  }
}
