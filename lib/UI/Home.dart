import 'package:flutter/material.dart';



class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  TextEditingController _firstNumberController = TextEditingController();
  TextEditingController _secondNumberController = TextEditingController();
  double _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input Fields
            TextField(
              controller: _firstNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'First Number'),
            ),
            TextField(
              controller: _secondNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Second Number'),
            ),
            SizedBox(height: 20),

            // Calculator Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOperationButton('+', Icons.add, _add),
                _buildOperationButton('-', Icons.remove, _subtract),
                _buildOperationButton('x', Icons.close, _multiply),
                _buildOperationButton('/', Icons.linear_scale, _divide),
              ],
            ),

            SizedBox(height: 20),

            // Result Display
            Text(
              'Result: $_result',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOperationButton(String label, IconData icon, Function() onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }

  void _add() {
    _performOperation((a, b) => a + b);
  }

  void _subtract() {
    _performOperation((a, b) => a - b);
  }

  void _multiply() {
    _performOperation((a, b) => a * b);
  }

  void _divide() {
    _performOperation((a, b) {
      if (b != 0) {
        return a / b;
      } else {
        // Handle division by zero case
        return 0;
      }
    });
  }

  void _performOperation(double Function(double, double) operation) {
    double firstNumber = double.tryParse(_firstNumberController.text) ?? 0;
    double secondNumber = double.tryParse(_secondNumberController.text) ?? 0;

    setState(() {
      _result = operation(firstNumber, secondNumber) ?? 0;
    });
  }
}
