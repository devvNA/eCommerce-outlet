import 'package:intl/intl.dart';

class CurrencyFormat {
  static String convertToIdr(dynamic number, {int? decimalDigit}) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit ?? 0,
    );
    return currencyFormatter.format(number);
  }
}
