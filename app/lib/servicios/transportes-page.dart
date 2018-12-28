import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './servicio.dart';

class Transportes extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _TransportesState();
  }
}

class _TransportesState extends State<Transportes> {
  bool _isLoading = true;
  var transportes;

  _fetchData() async {
    final url = 'https://api.myjson.com/bins/13s9x8';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> transportesJson = json.decode(utf8.decode(response.bodyBytes));

      if (mounted) {
        setState(() {
          _isLoading = false;
          this.transportes = transportesJson;
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
        title: new Text('Transportes'),
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
                itemCount: this.transportes != null ? this.transportes.length : 0,
                itemBuilder: (context, i) {
                  final servicio = this.transportes[i];
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
