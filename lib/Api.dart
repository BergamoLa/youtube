import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_API = "AIzaSyBxeBBYeXQomV4sD1ZNn6ipgbSK_-ed84k";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
String pesquisa = "";
var url = Uri.parse(
    "https://www.googleapis.com/youtube/v3/search?part=snippet&type=video&maxresults=20&order=date&key=$CHAVE_API&channelId=$ID_CANAL&q=$pesquisa");

class Api {
  Future pesquisar(pesquisa) async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print("ok 200");
      response.body;
    } else {}
  }
}
