class ApiUrl {
  static const String base = 'https://api.exchangerate.host/';
  static String baseCurrencyUrl(String baseCurrency) =>
      'https://api.exchangerate.host/latest?base=$baseCurrency';
}
