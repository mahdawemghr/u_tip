import 'package:flutter/material.dart';

class BillAmountField extends StatelessWidget {
  const BillAmountField({
    super.key,
    required this.billAmount,
    required this.onChanged,
    this.style,
  });

  final String billAmount;
  final ValueChanged<String> onChanged;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final desiredColor = Theme.of(context).colorScheme.primary;

    return TextField(
      keyboardType: TextInputType.number,
      style: style?.copyWith(fontWeight: FontWeight.normal),

      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: desiredColor, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: desiredColor, width: 2.0),
        ),
        border: const OutlineInputBorder(),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('BHD ', style: style?.copyWith(fontSize: 12))],
          ),
        ),
        labelText: 'Bill Amount',
        labelStyle: style?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
      onChanged: (String value) {
        onChanged(value);
      },
    );
  }
}
