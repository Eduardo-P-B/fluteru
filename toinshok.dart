import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:toinshok/Post.dart';

class Toinshok extends StatefulWidget {
  const new({super.key});

  @override
  State<Toinshok> createState() => _ToinshokState();
}

class _ToinshokState extends State<Toinshok> {

  Post meuPost = new Post();

  Future<void>fazerRequisicao() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    http.Response resposta = await http.get(url);
    var dados = jsonDecode(resposta.body);
    meuPost = Post.fromJson(dados);
    setState(() {
      meuPost = meuPost;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Toinshok')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("User ID: " + meuPost.userId.toString()),
            Text("ID: " + meuPost.id.toString()),
            Text("Title: " + meuPost.title),
            Text("Body: " + meuPost.body),
            ElevatedButton(onPressed: () {
              fazerRequisicao();
            }, child: Text("Fazer Requisição"))
          ],
        ),
      ),
    );
  }
}
