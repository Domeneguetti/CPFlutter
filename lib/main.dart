import 'package:flutter/material.dart';
import 'contato.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Contatos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListaDeContatos(),
    );
  }
}

class ListaDeContatos extends StatefulWidget {
  @override
  _ListaDeContatosState createState() => _ListaDeContatosState();
}

class _ListaDeContatosState extends State<ListaDeContatos> {
  int get totalFavoritos {
    return contatos.where((contato) => contato.isFavorito).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(totalFavoritos > 0 ? 'Contatos Favoritos: $totalFavoritos' : 'Lista de Contatos'),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(contatos[index].imagemUrl),
            ),
            title: Text(contatos[index].nome),
            subtitle: Text(contatos[index].email),
            trailing: IconButton(
              icon: Icon(
                contatos[index].isFavorito ? Icons.favorite : Icons.favorite_border,
                color: contatos[index].isFavorito ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  contatos[index].isFavorito = !contatos[index].isFavorito;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
