// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Marow extends StatelessWidget {
  const Marow(
      {Key? key,
      required this.text1,
      required this.text2,
      required this.mainAxisAlignment,
      required this.onPressed})
      : super(key: key);
  final String text1;
  final String text2;
  final MainAxisAlignment mainAxisAlignment;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(text1),
          TextButton(
            onPressed: onPressed,
            child: Text(text2,
                style: const TextStyle(
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
