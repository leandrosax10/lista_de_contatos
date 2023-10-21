import 'package:flutter/material.dart';
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
        drawer:const CustonDrawer(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
          //chamar tela de cadastro
          showDialog(context: context, builder: (BuildContext bc) {
          
          return const AlertDialog( title: Text("Adicionar contato"),content: TextField());
          });
          },
        ),
      ),
    );
  }
}
