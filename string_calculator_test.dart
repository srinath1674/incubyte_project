import 'package:test/test.dart';
import '../lib/string_calculator.dart';

void main() {
  final calculator = StringCalculator();

  test('empty string returns 0', () {
    expect(calculator.add(''), equals(0));
  });

  test('single number returns that number', () {
    expect(calculator.add('5'), equals(5));
  });

  test('two numbers, comma delimited, returns sum', () {
    expect(calculator.add('3,4'), equals(7));
  });

  test('multiple numbers', () {
    expect(calculator.add('1,2,3,4'), equals(10));
  });

  test('handles newlines', () {
    expect(calculator.add('1\n2,3'), equals(6));
  });

  test('custom delimiter ;', () {
    expect(calculator.add('//;\n2;3'), equals(5));
  });

  test('throws on single negative', () {
    expect(() => calculator.add('2,-3'), throwsA(isA<NegativeNumberException>()));
  });

  test('multiple negatives in exception message', () {
    try {
      calculator.add('-1,-2,3');
    } catch (e) {
      expect(e.toString(), contains('negative numbers not allowed -1,-2'));
    }
  });
}
