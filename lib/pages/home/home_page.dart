import 'package:flutter/material.dart';
import '../../model/contatos_model.dart';
import '../../repositories/contatos_repository.dart';
import '../../shared/widgets/custon_drawer.dart';

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

  void obterContatos() async {
    setState(() {
      carregando = true;
    });
    _contatosBack = await contatosRepository.obterContatos();

    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Contatos"),
      ),
      drawer: const CustonDrawer(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            nomeController.text = "";
            telefoneController.text = "";
            emailController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Adicionar contato"),
                    content: ListView(children: [
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
                    ]),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: () async {
                            await contatosRepository.criar(
                                ContatoBackModel.criar(
                                    nomeController.text,
                                    telefoneController.text,
                                    emailController.text));
                            Navigator.pop(context);
                            obterContatos();
                            setState(() {});
                          },
                          child: const Text("Salvar"))
                    ],
                  );
                });
          }),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            /* child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
            ), */
          ),
          carregando
              ? const CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                      itemCount: _contatosBack.contatos.length,
                      itemBuilder: (BuildContext bc, int index) {
                        var contato1 = _contatosBack.contatos[index];
                        return Dismissible(
                          onDismissed:
                              (DismissDirection dismissDirection) async {
                            // await contatosRepository.remover(tarefa.objectId);
                            obterContatos();
                          },
                          key: Key(contato1.nome),
                          child: ListTile(
                            title: Text(contato1.nome),
                            subtitle: Text(contato1.telefone),
                          ),
                        );
                      }),
                ),
        ]),
      ),
    );
  }
}
