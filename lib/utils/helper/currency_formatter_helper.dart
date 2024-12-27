import 'package:intl/intl.dart';

abstract class CurrencyFormatterHelper {
  static String convertFormatFraction(amount) {
    final formatFraction = NumberFormat("#,##0.00", "pt_BR");

    String convertDoubleToString = (double.parse(amount.toString())).toStringAsFixed(2).toString();

    return formatFraction.format(double.tryParse(convertDoubleToString.replaceAll('.', '').replaceAll(',', '.'))! / 100);
  }
}
