import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.theme,
    required int personCount,
    required this.decrementPerson,
    required this.incrementPerson,
    required this.style,
    required this.iconColor,
  }) : _personCount = personCount;

  final ThemeData theme;
  final int _personCount;
  final VoidCallback decrementPerson;
  final VoidCallback incrementPerson;
  final TextStyle style;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Split', style: style),
        Row(
          children: [
            IconButton(
              onPressed: () {
                decrementPerson();
              },
              icon: Icon(Icons.remove, color: iconColor),
            ),
            Text(
              '$_personCount',
              style: style.copyWith(fontWeight: FontWeight.normal),
            ),
            IconButton(
              onPressed: () {
                incrementPerson();
              },
              icon: Icon(Icons.add, color: iconColor),
            ),
          ],
        ),
      ],
    );
  }
}
