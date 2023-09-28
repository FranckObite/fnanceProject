import 'package:dapp/controllers/constante.dart';
import 'package:dapp/models/monTextFromField.dart';
import 'package:flutter/material.dart';

import '../models/monContainner.dart';
import 'connexion.dart';

String solde = '450.500';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  late final TextEditingController controllerTransactionNum;
  late final TextEditingController controllerTransactionMontant;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerTransactionMontant = TextEditingController();
    controllerTransactionNum = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerTransactionMontant.dispose();
    controllerTransactionNum.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: kColorBackground,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ConnexionPage()));
                          },
                          icon: const Icon(Icons.logout)),
                    ),
                  ),
                ),
                const Text(
                  'Solde :',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "$solde FCFA",
                  style: const TextStyle(
                      color: kColorsSolde,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 200,
                ),
                MonContainner(
                  onPressed1: () => monBottomSheet(context,
                      controllerTransactionNum, controllerTransactionMontant),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void monBottomSheet(
    BuildContext context,
    TextEditingController controller1,
    TextEditingController controller2,
  ) async {
    showModalBottomSheet(
        showDragHandle: true,
        backgroundColor: Colors.white,
        barrierColor: const Color.fromARGB(255, 53, 115, 168),
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                // Rendre le clavier souple pour pouvoir écrire
                bottom: MediaQuery.of(context).viewInsets.bottom + 100,
              ),
              height: 550,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text("Envoie de l'argent"),
                    const SizedBox(
                      height: 40,
                    ),
                    monTextFromfield(
                        controller: controller1,
                        obscureText: false,
                        hintText: "Envoyer à",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Champ obligatoire';
                          }
                          return null;
                        }),
                    monTextFromfield(
                      controller: controller2,
                      obscureText: false,
                      hintText: 'Entrer le montant',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Champ obligatoire';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Avec soutraly, aucun frais à payer",
                      style: TextStyle(color: kColorBackground),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kColorBackground),
                        onPressed: () {
                          setState(() {
                            controller1.text = '';
                            controller2.text = '';
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("Envoyer"))
                  ],
                ),
              ),
            ));
  }
}
