import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/video.dart';

const CHAVE_API = "AIzaSyBxeBBYeXQomV4sD1ZNn6ipgbSK_-ed84k";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
String pesquisa = "";
var url = Uri.parse(
    "https://www.googleapis.com/youtube/v3/search?part=snippet&type=video&maxResults=20&order=date&key=$CHAVE_API&channelId=$ID_CANAL&q=$pesquisa");

class Api {
  Future <List<Video>> pesquisar (String pesquisa) async {
    http.Response response = await http.get(url);

      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
           return Video.json(map);
          }

      ).toList();
      // for(var video in videos ){
      //   print("res " + video.titulo.toString());
      // }
      return videos;


  }
}
