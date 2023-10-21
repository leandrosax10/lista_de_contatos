import 'package:flutter/material.dart';

import '../../model/contatos_model.dart';
import '../../repositories/contatos_repository.dart';

class ContatoPage extends StatefulWidget {
  const ContatoPage({super.key});

  @override
  State<ContatoPage> createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  ContatosRepository contatosRepository = ContatosRepository();
  var _contatosBack = ContatosModel([]);
  var nomeController = TextEditingController();
  var telefoneController = TextEditingController();
  var emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    obterContatos();
  }

  obterContatos() async {
    _contatosBack = await contatosRepository.obterContatos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Text("Nome"),
            TextFormField(
              controller: nomeController,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 20),
            const Text("Telefone"),
            TextFormField(
              controller: telefoneController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            const Text("E-mail"),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () async {},
                child: const Text("Salvar"),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
