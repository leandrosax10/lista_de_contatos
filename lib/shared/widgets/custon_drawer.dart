import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lista_de_contatos/pages/home/home_page.dart';

import '../../pages/sobre/sobre_page.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        const SizedBox(
          height: 40,
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.addressBook,
                    color: Color.fromARGB(255, 25, 3, 29),
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text("Sobre"),
                ],
              )),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SobrePage()));
          },
        ),
        const Divider(),
        const SizedBox(height: 10),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 5),
                  Text("Sair"),
                ],
              )),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    alignment: Alignment.centerLeft,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    title: const Text(
                      "Meu App",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    content: const Wrap(
                      children: [
                        Text("Você sairá do aplicativo!"),
                        Text("Deseja realmente sair do aplicativo?"),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Não")),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          child: const Text("Sim")),
                    ],
                  );
                });
          },
        ),
      ]),
    );
  }
}
