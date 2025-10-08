import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u_tip/provider/ThemProvider.dart';
import 'package:u_tip/provider/TipCalculatorModel.dart';
import 'package:u_tip/widgets/bill_amount_field.dart';
import 'package:u_tip/widgets/person_counter.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Tipcalculatormodel()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
    //? intilizing _______________________________________________________________________
    final tipCalc = Provider.of<Tipcalculatormodel>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
      fontWeight: FontWeight.bold,
    );

    //? Scaffold Widget for the main structure of the app _________________________________
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? Colors.grey[900]
          : Colors.grey[200],
      //? AppBar Widget __________________________________________________________________
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'UTip',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: theme.colorScheme.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                themeProvider.toggleTheme();
              },
              icon: themeProvider.isDarkMode
                  ? Icon(Icons.nightlight_outlined, color: Colors.white)
                  : Icon(Icons.wb_sunny_outlined, color: Colors.white),
            ),
          ),
        ],
      ),

      //? Body Widget ____________________________________________________________________
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //? Total Per Person Container _________________________________________________
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total Per Person',
                  style: style.copyWith(color: Colors.white),
                ),
                Text(
                  'BHD ${(tipCalc.totalPerPerson()).toStringAsFixed(3)}',
                  style: style.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),

          //? Input Section Container ____________________________________________________
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(40),
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
                  style: style,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: PersonCounter(
                    theme: theme,
                    personCount: tipCalc.personCount,
                    decrementPerson: tipCalc.decrementPerson,
                    incrementPerson: tipCalc.incrementPerson,
                    style: style,
                    iconColor: themeProvider.isDarkMode
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tax', style: style),
                    Text(
                      'BHD ${(tipCalc.billTotall * tipCalc.tipPercentage).round()}',
                      style: style.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Text(
                        '${(tipCalc.tipPercentage * 100).round()}%',
                        style: style.copyWith(fontWeight: FontWeight.normal),
                      ),
                      Slider(
                        max: 0.5,
                        value: tipCalc.tipPercentage,
                        onChanged: (value) {
                          tipCalc.tipPercentage = value;
                        },
                        divisions: 10,
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
