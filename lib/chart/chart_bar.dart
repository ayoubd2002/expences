import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';

class bar extends StatelessWidget {
  const bar({super.key, required this.fill});
  final double fill;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(height: fill,color: Colors.amber,)));
  }
}
