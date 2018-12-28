import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './servicio.dart';

class Restaurantes extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _RestaurantesState();
  }
}

class _RestaurantesState extends State<Restaurantes> {
  bool _isLoading = true;
  var restaurantes;

  _fetchData() async {
    final url = 'https://api.myjson.com/bins/13nzlo';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> restaurantesJson = json.decode(utf8.decode(response.bodyBytes));

      if (mounted) {
        setState(() {
          _isLoading = false;
          this.restaurantes = restaurantesJson;
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
        title: new Text('Restaurantes'),
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
                itemCount: this.restaurantes != null ? this.restaurantes.length : 0,
                itemBuilder: (context, i) {
                  final servicio = this.restaurantes[i];
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
