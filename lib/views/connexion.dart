import 'package:flutter/material.dart';

import '../models/ma_row.dart';
import '../models/monTextFromField.dart';
import 'inscription_page.dart';
import 'transactionPage.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController controllerNumMatricul;
  late final TextEditingController controllerPassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerNumMatricul = TextEditingController();
    controllerPassword = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerNumMatricul.dispose();
    controllerPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00A8DE),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/Money__2_-removebg-preview.png",
                  width: 300,
                  height: 300,
                ),
                const Spacer(),
                monTextFromfield(
                    controller: controllerNumMatricul,
                    hintText: "N° Matricule",
                    obscureText: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Champ obligatoire';
                      }
                      return null;
                    }),
                monTextFromfield(
                    controller: controllerPassword,
                    hintText: "Mot de Passe",
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Champ obligatoire';
                      }
                      return null;
                    }),
                Marow(
                  text1: 'Mot de passe',
                  text2: 'oublié?',
                  mainAxisAlignment: MainAxisAlignment.end,
                  onPressed: () {
                    monDialog(context, controllerNumMatricul);
                  },
                ),
                const Spacer(),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TransactionPage()));
                      setState(() {
                        controllerNumMatricul.text = '';
                        controllerPassword.text = '';
                      });
                    },
                    child: const Text(
                      "Connexion",
                      style: TextStyle(color: Colors.black),
                    )),
                const Spacer(),
                Marow(
                  text1: 'Pas de compte?',
                  text2: 'Creér en un!',
                  mainAxisAlignment: MainAxisAlignment.center,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InscriptionPage()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void monDialog(BuildContext context, TextEditingController controller) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Modifer le mot de passe"),
            content: monTextFromfield(
                controller: controller, obscureText: false, hintText: "email"),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Annuler")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text("Modifier le mot passe")),
                ],
              )
            ],
          );
        });
  }
}
