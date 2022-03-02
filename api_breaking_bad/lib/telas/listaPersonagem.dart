import 'dart:convert';
import 'package:flutter/material.dart';

import '../data/personagem_api.dart';
import '../model/personagem.dart';

class ListaPersonagem extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PersonagemListaState();
  }
}

class PersonagemListaState extends State<ListaPersonagem>{
  List<Personagem> personagensLista = <Personagem>[];

  void getpersonagensFromAPI() async{
    PersonagemAPI.getPersonagens().then((response){
      setState(() {
        Iterable lista = json.decode(response.body);
        personagensLista = lista.map((model) => Personagem.fromJson(model)).toList();
      });
    });
  }

  //método que vai pegar os personsagens
  @override
  void initState(){
    getpersonagensFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personagens BREAKING BAD"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: personagensLista.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(personagensLista[index].name,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                subtitle: Text(personagensLista[index].nickname,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(personagensLista[index].img),
                ),
              );
            }),
      ),
    );
  }
}