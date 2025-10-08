import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u_tip/provider/TipCalculatorModel.dart';
import 'package:u_tip/widgets/bill_amount_field.dart';
import 'package:u_tip/widgets/persont_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      debugShowCheckedModeBanner: false,
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    final tipCalc = Provider.of<Tipcalculatormodel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('UTip')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 70, right: 70, top: 50),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Total Per Person', style: style),
                Text(
                  'BHD ${(tipCalc.totalPerPerson()).toStringAsFixed(3)}',
                  style: style,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 70, right: 70, top: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: theme.colorScheme.primary, width: 2),
            ),
            child: Column(
              children: [
                BillAmountField(
                  billAmount: tipCalc.billTotall.toString(),
                  onChanged: (value) {
                    tipCalc.billTotall = value.isEmpty
                        ? 0
                        : double.parse(value);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: PersonCounter(
                    theme: theme,
                    personCount: tipCalc.personCount,
                    decrementPerson: tipCalc.decrementPerson,
                    incrementPerson: tipCalc.incrementPerson,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tip', style: theme.textTheme.titleSmall),
                    Text('BHD ${tipCalc.billTotall * tipCalc.tipPercentage}'),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Text('${(tipCalc.tipPercentage * 100).round()}%'),
                      Slider(
                        value: tipCalc.tipPercentage,
                        onChanged: (value) {
                          tipCalc.billTotall = value;
                        },
                        divisions: 4,
                        label: (tipCalc.tipPercentage * 100).round().toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
