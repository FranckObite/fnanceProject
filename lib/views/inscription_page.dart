import 'package:dapp/controllers/constante.dart';
import 'package:dapp/models/monTextFromField.dart';
import 'package:dapp/views/connexion.dart';
import 'package:flutter/material.dart';

import '../models/ma_row.dart';
import 'transactionPage.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController controllerNom;
  late final TextEditingController controllerPrenom;
  late final TextEditingController controllerNumMatricule;
  late final TextEditingController controllerMotDePasse;
  late final TextEditingController controllerConfirmerMotdePasse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerNom = TextEditingController();
    controllerPrenom = TextEditingController();
    controllerNumMatricule = TextEditingController();
    controllerMotDePasse = TextEditingController();
    controllerConfirmerMotdePasse = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerNom.dispose();
    controllerPrenom.dispose();
    controllerNumMatricule.dispose();
    controllerMotDePasse.dispose();
    controllerConfirmerMotdePasse.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Champ obligatoire';
                        }
                        return null;
                      },
                      controller: controllerNom,
                      obscureText: false,
                      hintText: "Nom"),
                  monTextFromfield(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Champ obligatoire';
                        }
                        return null;
                      },
                      controller: controllerPrenom,
                      obscureText: false,
                      hintText: "Prenom"),
                  monTextFromfield(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Champ obligatoire';
                        }
                        return null;
                      },
                      controller: controllerNumMatricule,
                      obscureText: false,
                      hintText: "N°Matricul"),
                  monTextFromfield(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Champ obligatoire';
                        }
                        return null;
                      },
                      controller: controllerMotDePasse,
                      obscureText: true,
                      hintText: "Mot de passe"),
                  monTextFromfield(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Champ obligatoire';
                        }
                        return null;
                      },
                      controller: controllerConfirmerMotdePasse,
                      obscureText: true,
                      hintText: "Confirmer le mot de passe"),
                  const Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {
                        setState(() {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TransactionPage()));
                          setState(() {
                            controllerNom.text = '';
                            controllerPrenom.text = '';
                            controllerNumMatricule.text = '';
                            controllerMotDePasse.text = '';
                            controllerConfirmerMotdePasse.text = '';
                          });
                        });
                      },
                      child: const Text(
                        "Inscription",
                        style: TextStyle(color: Colors.black),
                      )),
                  const Spacer(),
                  Marow(
                    text1: 'Vous avez déjà un compte?',
                    text2: 'Connectez-vouz!',
                    mainAxisAlignment: MainAxisAlignment.center,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ConnexionPage()));
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }
}
