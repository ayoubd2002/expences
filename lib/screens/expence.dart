import 'package:expences/chart/chart.dart';
import 'package:expences/models/expences.dart';
import 'package:expences/models/list.dart';
import 'package:expences/screens/expenclist/expences_list.dart';
import 'package:expences/screens/new.dart';
import 'package:flutter/material.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expences> {
  void addexpence(expence e) {
    setState(() {
      register.add(e);
    });
  }

  void deleteexp(expence e) {
    setState(() {
      register.remove(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcom'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    useSafeArea: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (c) => SizedBox(
                        height: 500,
                        width: double.infinity,
                        child: newexp(onadd: addexpence)));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: width < 600
          ? Center(
              child: Column(
                children: [
                  chart(expences: register),
                  Expanded(
                    child: expenseslist(
                      register: register,
                      remove: deleteexp,
                    ),
                  )
                ],
              ),
            )
          : Row(
              children: [
                Expanded(child: chart(expences: register)),
                Expanded(
                  child: expenseslist(
                    register: register,
                    remove: deleteexp,
                  ),
                )
              ],
            ),
    );
  }
}
