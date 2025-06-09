import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final datetime = DateFormat.yMd();

enum Categoryi { food, travel, lazhar, work }

const categoryicons = {
  Categoryi.food: Icons.lunch_dining,
  Categoryi.lazhar: Icons.games,
  Categoryi.travel: Icons.flight_takeoff,
  Categoryi.work: Icons.work
};

class expence {
  final String id;
  final String title;
  final double price;
  final DateTime date;
  final Categoryi category;

  String get dateformate {
    return datetime.format(date);
  }

  expence(
      {required this.title,
      required this.price,
      required this.date,
      required this.category})
      : id = uuid.v4();
}

class expensetotal {
  final Categoryi category;
  final List<expence> expences;

  expensetotal(this.category, this.expences);

  expensetotal.forcategory(List<expence> allexpenc, this.category)
      : expences = allexpenc.where((element) => element.category==category).toList();

  
  double get totalexpances {
    double sum = 0;
    for (var element in expences) {
      sum += element.price;
    }
    return sum;
  }
}
