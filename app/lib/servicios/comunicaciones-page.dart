import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './servicio.dart';

class Comunicaciones extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _ComunicacionesState();
  }
}

class _ComunicacionesState extends State<Comunicaciones> {
  bool _isLoading = true;
  var comunicaciones;

  _fetchData() async {
    final url = 'https://api.myjson.com/bins/16aido';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> comunicacionesJson = json.decode(utf8.decode(response.bodyBytes));

      if (mounted) {
        setState(() {
          _isLoading = false;
          this.comunicaciones = comunicacionesJson;
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
        title: new Text('Comunicaciones'),
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
                itemCount: this.comunicaciones != null ? this.comunicaciones.length : 0,
                itemBuilder: (context, i) {
                  final servicio = this.comunicaciones[i];
                  return new FlatButton(
                    padding: new EdgeInsets.all(0.0),
                    child: new Servicio(servicio),
                    onPressed: () => {},
                  );
                },
              ),
      ),
    );
  }
}
