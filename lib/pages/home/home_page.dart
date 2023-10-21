import 'package:flutter/material.dart';
import 'package:lista_de_contatos/repositories/contatos_repository.dart';
import '../../shared/widgets/custon_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          
            var contato = ContatosRepository();
            var contatos = await contato.obterContatos();
            print(contatos);

            //chamar tela de cadastro
            /*  showDialog(context: context, builder: (BuildContext bc) {
          
          return const AlertDialog( title: Text("Adicionar contato"),content: TextField());
          }); */
          },
        ),
      ),
    );
  }
}
