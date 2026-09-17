import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/services/calculator_engine.dart';

void main() {
  late CalculatorEngine engine;

  setUp(() {
    engine = CalculatorEngine();
  });

  test('adds two numbers', () {
    engine.inputDigit('5');
    engine.inputOperator('+');
    engine.inputDigit('3');
    engine.equals();
    expect(engine.display, '8');
  });

  test('subtracts two numbers', () {
    engine.inputDigit('9');
    engine.inputOperator('-');
    engine.inputDigit('4');
    engine.equals();
    expect(engine.display, '5');
  });

  test('multiplies two numbers', () {
    engine.inputDigit('6');
    engine.inputOperator('×');
    engine.inputDigit('7');
    engine.equals();
    expect(engine.display, '42');
  });

  test('divides two numbers', () {
    engine.inputDigit('9');
    engine.inputOperator('÷');
    engine.inputDigit('2');
    engine.equals();
    expect(engine.display, '4.5');
  });

  test('division by zero shows Error', () {
    engine.inputDigit('5');
    engine.inputOperator('÷');
    engine.inputDigit('0');
    engine.equals();
    expect(engine.display, 'Error');
  });

  test('clear resets to zero', () {
    engine.inputDigit('7');
    engine.clear();
    expect(engine.display, '0');
  });

  test('toggle sign flips value', () {
    engine.inputDigit('5');
    engine.toggleSign();
    expect(engine.display, '-5');
  });

  test('percent divides by 100', () {
    engine.inputDigit('5');
    engine.inputDigit('0');
    engine.percent();
    expect(engine.display, '0.5');
  });

  test('chained operations calculate left to right', () {
    engine.inputDigit('2');
    engine.inputOperator('+');
    engine.inputDigit('3');
    engine.inputOperator('×');
    engine.inputDigit('4');
    engine.equals();
    expect(engine.display, '20');
  });
}
