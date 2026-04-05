


import 'package:flutter/material.dart';

class ColoredTextSection extends StatelessWidget {
  const ColoredTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                border: BorderDirectional(
                    start: BorderSide(color: Color(0xff3CC563), width: 6))),
            child: const Text.rich(
              TextSpan(
                text: ' Translate',
                style: TextStyle(
                    color: Color(0xff3CC563),
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
                children: <TextSpan>[
                  TextSpan(
                    text: ' From ',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: 'Sgin Language',
                    style: TextStyle(
                        color: Color(0xff3CC563),
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
