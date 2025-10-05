import 'package:flutter/material.dart';
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
  int _personCount = 1;

  void _incrementPerson() {
    setState(() {
      _personCount++;
    });
  }

  void _decrementPerson() {
    setState(() {
      if (_personCount > 1) {
        _personCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
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
                Text('BHD 0.00', style: style),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 70, right: 70, top: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: theme.colorScheme.primary, width: 2),
            ),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('BHD ')],
                    ),
                    labelText: 'Bill Amount',
                  ),
                  onChanged: (String value) {},
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: PersonCounter(
                    theme: theme,
                    personCount: _personCount,
                    decrementPerson: _decrementPerson,
                    incrementPerson: _incrementPerson,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tip', style: theme.textTheme.titleSmall),
                    Text('BHD 0.00'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Text('20.00%'),
                      Slider(value: 0.5, onChanged: (v) {}),
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
