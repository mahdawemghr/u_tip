import 'package:flutter/material.dart';

class BillAmountField extends StatelessWidget {
  const BillAmountField({
    super.key,
    required this.billAmount,
    required this.onChanged,
  });

  final String billAmount;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('BHD ')],
        ),
        labelText: 'Bill Amount',
      ),
      onChanged: (String value) {
        onChanged(value);
      },
    );
  }
}
