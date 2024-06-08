import 'dart:async';

import 'package:flutter/material.dart';

class CalculateWidget extends StatefulWidget {
  final double maxvalue;
  final Color textColor;
  const CalculateWidget({
    super.key,
    required this.maxvalue,
    required this.textColor,
  });

  @override
  State<CalculateWidget> createState() => _CalculateWidgetState();
}

class _CalculateWidgetState extends State<CalculateWidget> {
  int values = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    calculate();
  }

  calculate() {
    timer = Timer.periodic(const Duration(microseconds: 100), (timer) {
      setState(() {
        values != widget.maxvalue ? values++ : null;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text("2 $values",
        style: TextStyle(
          fontFamily: 'Poppins',
          color: widget.textColor,
          fontSize: 30,
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
        ));
  }
}
