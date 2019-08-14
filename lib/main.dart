import 'package:flutter/material.dart';

void main() => runApp(TipCalculator());

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double billAmount = 0.0;
  double tipPercentage = 0.0;
  double totalBill;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.yellow,
          appBar: AppBar(
            title: Text('Tip Calculator'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Bill Amount: Rs.'),
                  onChanged: (String value) {
                    try {
                      billAmount = double.parse(value);
                    } catch (exception) {
                      billAmount = 0.0;
                    }
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Tip %'),
                  onChanged: (String value) {
                    try {
                      tipPercentage = double.parse(value);
                    } catch (exception) {
                      tipPercentage = 0.0;
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        child: Text('Bill amount'),
                        onPressed: () {
                          setState(() {
                            double tipAmount = billAmount * tipPercentage / 100;
                            totalBill = billAmount + tipAmount;
                            /*print("Tip: Rs. $tipAmount \n"
                                "Total bill: Rs. $totalBill");*/
                          });

                          //AlertDialog dialog = AlertDialog();
                        }),
                    Text('\t Rs. $totalBill'),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
