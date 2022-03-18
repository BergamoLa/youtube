import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/model/video.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _loadData(){
    Future <List<Video>>? videos;
    Api api = Api();
    videos = api.pesquisar(pesquisa) as Future<List<Video>>?;
    return videos;
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: _loadData(),
        builder: (BuildContext ctx, AsyncSnapshot<List<Video>> snapshot) =>
        snapshot.hasData
            ? ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (BuildContext context, index) {
            List<Video>? videos = snapshot.data;
            Video video = videos![index];
            return Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(video.imagem.toString()),
                      )

                  ),
                ),
                ListTile(
                  title: Text(video.titulo.toString()),
                  subtitle: Text(video.descricao.toString()),
                ),
              ],
            );
          },


        )
            : Center(
          child: CircularProgressIndicator(

          ),
        )
    );

  }
}
