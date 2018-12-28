import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './servicio.dart';

class Hoteles extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _HotelesState();
  }
}

class _HotelesState extends State<Hoteles> {
  bool _isLoading = true;
  var hoteles;

  _fetchData() async {
    final url = 'https://api.myjson.com/bins/rtgnw';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> hotelesJson = json.decode(utf8.decode(response.bodyBytes));

      if (mounted) {
        setState(() {
          _isLoading = false;
          this.hoteles = hotelesJson;
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
        title: new Text('Hoteles'),
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
                itemCount: this.hoteles != null ? this.hoteles.length : 0,
                itemBuilder: (context, i) {
                  final servicio = this.hoteles[i];
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
