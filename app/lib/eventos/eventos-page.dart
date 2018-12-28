import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './evento.dart';
import './evento-detalle.dart';

class Eventos extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _EventosState();
  }
}

class _EventosState extends State<Eventos> {
  bool _isLoading = true;
  var eventos;

  _fetchData() async {
    final url = 'https://api.myjson.com/bins/v59xo';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> eventosJson = json.decode(utf8.decode(response.bodyBytes));

      if (mounted) {
        setState(() {
          _isLoading = false;
          this.eventos = eventosJson;
        });
      }
    }
  }

  @override
    void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('Eventos'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.refresh),
            onPressed: () {
              if (mounted) {
                setState(() {
                  _isLoading = true;
                });
              }
              _fetchData();
            },
          )
        ],
      ),
      body: new Center(
        child: _isLoading
            ? new CircularProgressIndicator()
            : new ListView.builder(
                itemCount: this.eventos != null ? this.eventos.length : 0,
                itemBuilder: (context, i) {
                  final evento = this.eventos[i];
                  return new FlatButton(
                    padding: new EdgeInsets.all(0.0),
                    child: new Evento(evento),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new EventoDetalle(evento)));
                    },
                  );
                },
              ),
      ),
    );
  }
}
