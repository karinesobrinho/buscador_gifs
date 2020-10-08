import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class home_page extends StatefulWidget {
  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  String _search;
  int _offSet;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null)
      response = await http.get(
          'https://api.giphy.com/v1/gifs/trending?api_key=S0eyg1Mr5yzv5W5R9708mMORAa42LtOR&limit=25&rating=g');
    else
      response = await http.get(
          'https://api.giphy.com/v1/gifs/search?api_key=S0eyg1Mr5yzv5W5R9708mMORAa42LtOR&q=$_search&limit=25&offset=$_offSet&rating=g&lang=en');
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Image.network(
          "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
    ),
    backgroundColor: Colors.black,
    body: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
            labelText: 'Pesquise aqui',
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder()
          ),
          style: TextStyle(color:  Colors.white, fontSize: 18.0),
          textAlign: TextAlign.center,
          ),  
        ),
        Expanded(
          child: FutureBuilder(
            future: _getGifs(),
            builder: (context, snapshot){
              switch (snapshot.connectionState){
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return Container(
                    width: 200.0,
                    height: 200.0,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 5.0,
                    ),
                  );
                default: 
                  if(snapshot.hasError) return Container();
                  else _createGifTable(context, snapshot);
              }
            }
          )
        ),
      ],
    ),
    );
    Widget _createGifTable(){}
  }
}
