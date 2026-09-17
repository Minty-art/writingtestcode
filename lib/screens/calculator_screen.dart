import 'package:flutter/material.dart';
import '../services/calculator_engine.dart';
import '../widgets/calc_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorEngine _engine = CalculatorEngine();

  void _update(VoidCallback action) {
    setState(action);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Text(
                      _engine.display,
                      style: const TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildButtonGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CalcButton(
                label: 'C',
                type: CalcButtonType.function,
                onTap: () => _update(_engine.clear),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CalcButton(
                label: '±',
                type: CalcButtonType.function,
                onTap: () => _update(_engine.toggleSign),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CalcButton(
                label: '%',
                type: CalcButtonType.function,
                onTap: () => _update(_engine.percent),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CalcButton(
                label: '÷',
                type: CalcButtonType.operatorBtn,
                onTap: () => _update(() => _engine.inputOperator('÷')),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _numberRow(['7', '8', '9'], '×'),
        const SizedBox(height: 12),
        _numberRow(['4', '5', '6'], '-'),
        const SizedBox(height: 12),
        _numberRow(['1', '2', '3'], '+'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CalcButton(
                label: '0',
                onTap: () => _update(() => _engine.inputDigit('0')),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CalcButton(
                label: '.',
                onTap: () => _update(_engine.inputDecimal),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CalcButton(
                label: '=',
                type: CalcButtonType.equals,
                onTap: () => _update(_engine.equals),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _numberRow(List<String> digits, String operator) {
    return Row(
      children: [
        for (final digit in digits) ...[
          Expanded(
            child: CalcButton(
              label: digit,
              onTap: () => _update(() => _engine.inputDigit(digit)),
            ),
          ),
          const SizedBox(width: 12),
        ],
        Expanded(
          child: CalcButton(
            label: operator,
            type: CalcButtonType.operatorBtn,
            onTap: () => _update(() => _engine.inputOperator(operator)),
          ),
        ),
      ],
    );
  }
}
