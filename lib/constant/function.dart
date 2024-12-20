import 'package:intl/intl.dart';

class GFunction {
  static String setCharName(String? value) {
    if (value != null) {
      List<String> splittedWords = value.split(" ");
      List<String> chars = [];
      for (String word in splittedWords) {
        if (word.isNotEmpty) {
          chars.add(word[0]);
        }
        if (chars.length == 3) break;
      }
      return chars.join("");
    } else {
      return "-";
    }
  }

  static String formatCurrency(num value) {
    NumberFormat currency = NumberFormat("#,##0.#", "id");
    return 'Rp ${currency.format(value)}';
  }
}
