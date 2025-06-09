import 'package:expences/chart/chart_bar.dart';
import 'package:expences/models/expences.dart';
import 'package:flutter/material.dart';

class chart extends StatelessWidget {
  const chart({super.key, required this.expences});
  final List<expence> expences;

  List<expensetotal> get pucket {
    return [
      expensetotal.forcategory(expences, Categoryi.food),
      expensetotal.forcategory(expences, Categoryi.work),
      expensetotal.forcategory(expences, Categoryi.travel),
      expensetotal.forcategory(expences, Categoryi.lazhar)
    ];
  }

  get maxtotal {
    double maxtotalexp = 0;
    for (var element in pucket) {
      if (element.totalexpances < maxtotalexp) {
        maxtotalexp = element.totalexpances;
      }
    }
    return maxtotalexp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 175,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
        Theme.of(context).colorScheme.primaryContainer,
      ])),
      child: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              for (final ele in pucket)
                bar(
                  fill:
                      ele.totalexpances == 0 ? 0 : ele.totalexpances / maxtotal,
                )
            ],
          )),
          const SizedBox(
            height: 13,
          ),
          Expanded(
              child: Row(
            children: pucket
                .map((e) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Icon(categoryicons[e.category]),
                    ))
                .toList(),
          ))
        ],
      ),
    );
  }
}
