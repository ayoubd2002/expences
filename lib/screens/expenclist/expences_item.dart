import 'package:expences/models/expences.dart';

import 'package:flutter/material.dart';

class expencesitem extends StatelessWidget {
  const expencesitem({super.key, required this.expences});
  final expence expences;
  //final Function(expence e) deletex;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            children: [
              Text(
                expences.title,
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('\$${expences.price.toStringAsFixed(2)}'),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryicons[expences.category]),
                      SizedBox(
                        width: 10,
                      ),
                      Text(expences.dateformate)
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
