// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dapp/controllers/constante.dart';

class MonContainner extends StatelessWidget {
  const MonContainner({
    Key? key,
    this.onPressed1,
    this.onPressed2,
  }) : super(key: key);
  final void Function()? onPressed1;
  final void Function()? onPressed2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: Row(
                  children: [
                    MesIcones(
                      icon: Icons.send,
                      onPressed: onPressed1,
                      text: 'Transactions',
                    ),
                    const Spacer(),
                    MesIcones(
                      icon: Icons.settings,
                      text: 'Paramètre',
                      onPressed: onPressed2,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: SizedBox(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        trailing: Text('montant de la transaction'),
                        title: Text(
                          "Type de transaction",
                          style: TextStyle(color: kColorBackground),
                        ),
                        subtitle: Text(
                          'Date de la transaction',
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(color: kColorBackground);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MesIcones extends StatelessWidget {
  const MesIcones({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: kColorBackground, borderRadius: BorderRadius.circular(20)),
          child: IconButton(
            icon: Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            onPressed: onPressed,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
