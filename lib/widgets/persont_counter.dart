import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.theme,
    required int personCount,
    required this.decrementPerson,
    required this.incrementPerson,
  }) : _personCount = personCount;

  final ThemeData theme;
  final int _personCount;
  final VoidCallback decrementPerson;
  final VoidCallback incrementPerson;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Split', style: theme.textTheme.titleSmall),
        Row(
          children: [
            IconButton(
              onPressed: () {
                decrementPerson();
              },
              icon: const Icon(Icons.remove),
            ),
            Text('$_personCount'),
            IconButton(
              onPressed: () {
                incrementPerson();
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
