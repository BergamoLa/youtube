import 'package:flutter/cupertino.dart';

class Video {
 late String? id;
 late String? titulo;
late  String? descricao;
late String? imagem;
 late String? canal;

 Video({this.id, this.titulo,  this.descricao, this.imagem, this.canal});

  converterJSon (Map<String, dynamic> json) async {


 }

 factory Video.json(Map<String, dynamic> json){
   return Video(
    titulo:  json['snippet']['title'],
     id:  json['id']['videoId'].toString(),
     descricao: json['snippet']['description'],
     imagem:  json['snippet']['thumbnails']['high'] ['url'],
     canal: json["snippet"]['channelId'],
   );
 }



}