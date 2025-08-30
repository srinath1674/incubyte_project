class NegativeNumberException implements Exception {
  final List<int> negatives;
  NegativeNumberException(this.negatives);

  @override
  String toString() => 'negative numbers not allowed ${negatives.join(",")}';
}

class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',|\n';
    String nums = numbers;

    final customDelimiterMatch = RegExp(r'^//(.+)\n').firstMatch(numbers);
    if (customDelimiterMatch != null) {
      delimiter = RegExp.escape(customDelimiterMatch.group(1)!);
      nums = numbers.substring(customDelimiterMatch.end);
    }

    final tokens = nums.split(RegExp(delimiter));
    final parsed = tokens.where((t) => t.isNotEmpty).map(int.parse);
    final negatives = parsed.where((n) => n < 0).toList();

    if (negatives.isNotEmpty) {
      throw NegativeNumberException(negatives);
    }

    return parsed.fold(0, (sum, n) => sum + n);
  }
}
