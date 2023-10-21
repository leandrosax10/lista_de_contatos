/* import 'package:flutter/material.dart';

import '../../model/contatos_model.dart';
import '../../repositories/contatos_repository.dart';
import '../../shared/widgets/custon_drawer.dart';
import '../contato/contato_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContatosRepository contatosRepository = ContatosRepository();
  var _contatosBack = ContatosModel([]);
  var nomeController = TextEditingController();
  var telefoneController = TextEditingController();
  var emailController = TextEditingController();
  var carregando = false;

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
          title: const Text("Home Page"),
        ),
        drawer: const CustonDrawer(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ContatoPage()));
          },
        ),
        body: Container(
          child: Expanded(
            child: ListView.builder(
              itemCount: _contatosBack.contatos.length,
              itemBuilder: (BuildContext bc, int index) {
                var contato = _contatosBack.contatos[index];
                return Dismissible(
                  onDismissed: (DismissDirection dismissDirection) async {
                    obterContatos();
                  },
                  key: Key(contato.nome),
                  child: ListTile(
                    title: Text(contato.nome),
                    trailing: Text(contato.email),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
 */




