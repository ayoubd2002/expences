import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expences.dart';

class newexp extends StatefulWidget {
  const newexp({super.key, required this.onadd});
  final Function(expence exp) onadd;

  @override
  State<newexp> createState() => _newexpState();
}

class _newexpState extends State<newexp> {
  final _usertitel = TextEditingController();
  final userprice = TextEditingController();
  final format = DateFormat.yMd();
  DateTime? selected;

  Categoryi c = Categoryi.food;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usertitel.dispose();
    userprice.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TextField(
                controller: _usertitel,
                maxLength: 100,
                decoration: InputDecoration(
                  label: Title(color: Colors.black, child: Text('Title')),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: userprice,
                      maxLength: 100,
                      decoration: InputDecoration(
                        label: Title(color: Colors.black, child: Text('price')),
                        prefixText: '\$',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(selected == null
                          ? 'no Select date'
                          : format.format(selected!)),
                      IconButton(
                          onPressed: () async {
                            final now = DateTime.now();
                            final first = DateTime(
                                now.year - 20, now.month, now.day - 15);
                            DateTime? pickdate = await showDatePicker(
                                context: context,
                                firstDate: first,
                                lastDate: now);
                            setState(() {
                              selected = pickdate;
                            });
                          },
                          icon: Icon(Icons.date_range)),
                    ],
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  DropdownButton(
                      value: c,
                      items: Categoryi.values
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name.toUpperCase()),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          c = value;
                        });
                      }),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel')),
                  ElevatedButton(
                      onPressed: () {
                        final double? enterprice =
                            double.tryParse(userprice.text);
                        final bool priceinvalid =
                            enterprice == null || enterprice <= 0;

                        if (_usertitel.text.trim().isEmpty ||
                            selected == null ||
                            priceinvalid) {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    title: Text('Invalid information'),
                                    content: Text(
                                      'check your information',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 244, 19, 3)),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(ctx);
                                          },
                                          child: Text('OK'))
                                    ],
                                  ));
                        } else {
                          widget.onadd(expence(
                              title: _usertitel.text,
                              price: enterprice,
                              date: selected!,
                              category: c));
                          Navigator.pop(context);
                        }
                      },
                      child: Text('save'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
