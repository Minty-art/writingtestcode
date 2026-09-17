/// Pure calculation logic for the calculator, kept separate from the UI
/// so it can be tested or swapped out independently.
class CalculatorEngine {
  String display = '0';
  double? _storedValue;
  String? _pendingOperator;
  bool _shouldResetDisplay = false;

  void inputDigit(String digit) {
    if (_shouldResetDisplay) {
      display = digit;
      _shouldResetDisplay = false;
    } else if (display == '0') {
      display = digit;
    } else {
      display += digit;
    }
  }

  void inputDecimal() {
    if (_shouldResetDisplay) {
      display = '0.';
      _shouldResetDisplay = false;
      return;
    }
    if (!display.contains('.')) {
      display += '.';
    }
  }

  void inputOperator(String operator) {
    if (_pendingOperator != null && !_shouldResetDisplay) {
      _calculate();
    } else {
      _storedValue = double.tryParse(display);
    }
    _pendingOperator = operator;
    _shouldResetDisplay = true;
  }

  void toggleSign() {
    final value = double.tryParse(display) ?? 0;
    display = _formatNumber(value * -1);
  }

  void percent() {
    final value = double.tryParse(display) ?? 0;
    display = _formatNumber(value / 100);
  }

  void backspace() {
    if (_shouldResetDisplay) return;
    if (display.length <= 1 || (display.length == 2 && display.startsWith('-'))) {
      display = '0';
    } else {
      display = display.substring(0, display.length - 1);
    }
  }

  void equals() {
    if (_pendingOperator == null) return;
    _calculate();
    _pendingOperator = null;
    _shouldResetDisplay = true;
  }

  void clear() {
    display = '0';
    _storedValue = null;
    _pendingOperator = null;
    _shouldResetDisplay = false;
  }

  void _calculate() {
    final current = double.tryParse(display) ?? 0;
    final stored = _storedValue ?? 0;
    double result;

    switch (_pendingOperator) {
      case '+':
        result = stored + current;
        break;
      case '-':
        result = stored - current;
        break;
      case '×':
        result = stored * current;
        break;
      case '÷':
        result = current == 0 ? double.nan : stored / current;
        break;
      default:
        result = current;
    }

    display = _formatNumber(result);
    _storedValue = result;
  }

  String _formatNumber(double value) {
    if (value.isNaN) return 'Error';
    if (value.isInfinite) return 'Error';
    if (value == value.roundToDouble() && value.abs() < 1e15) {
      return value.toInt().toString();
    }
    return value
        .toStringAsFixed(8)
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
  }
}
