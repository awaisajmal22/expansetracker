import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/text.dart';

class TotalSum extends StatelessWidget {
  final String _totalSum;
  const TotalSum(this._totalSum, {super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
              child: Column(
                children: [
              richText,
              SizedBox(height: 20,),
              FittedBox(
                child: RichText(
                  text: TextSpan(
                    style: style,
                    children: [
                      TextSpan(
                        text: _totalSum.toString(),
                        style: TextStyle(
                          color: Colors.red
                        )
                        )
                    ]
                )
                ),
              ),
              SizedBox(height: 10,)
                ]
              ),
              );
  }
}