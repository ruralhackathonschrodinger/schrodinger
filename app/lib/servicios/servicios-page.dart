import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './servicio.dart';

class Servicios extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _ServiciosState();
  }
}

class _ServiciosState extends State<Servicios> {
  bool _isLoading = true;
  var servicios;

  _fetchData() async {
    await new Future.delayed(const Duration(seconds: 1));
    final url = 'https://api.myjson.com/bins/ixw18';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> serviciosJson = json.decode(utf8.decode(response.bodyBytes));

      if (mounted) {
        setState(() {
          _isLoading = false;
          this.servicios = serviciosJson;
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
        title: new Text('Servicios'),
      ),
      body: new Center(
        child: _isLoading
            ? new CircularProgressIndicator()
            : new ListView.builder(
                itemCount: this.servicios != null ? this.servicios.length : 0,
                itemBuilder: (context, i) {
                  final servicio = this.servicios[i];
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
