import 'package:expences/models/expences.dart';
import 'package:expences/screens/expenclist/expences_item.dart';
import 'package:flutter/material.dart';
import '../expence.dart';

class expenseslist extends StatelessWidget {
  const expenseslist({
    super.key,
    required this.register,
    required this.remove,
  });
  final Function(expence e) remove;

  final List<expence> register;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: register.length,
        itemBuilder: (context, index) => Dismissible(
            onDismissed: (direction) => remove(register[index]),
            key: ValueKey(register[index]),
            child: expencesitem(
              expences: register[index],
            )));
  }
}
