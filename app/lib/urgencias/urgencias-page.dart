import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './urgencia.dart';

class Urgencias extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _UrgenciasState();
  }
}

class _UrgenciasState extends State<Urgencias> {
  var urgencias;
  bool _isLoading = true;

    _fetchData() async {
    await new Future.delayed(const Duration(seconds: 1));
    final url = 'https://api.myjson.com/bins/jd3vg';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> urgenciasJson = json.decode(utf8.decode(response.bodyBytes));

      if (mounted) {
        setState(() {
          _isLoading = false;
          this.urgencias = urgenciasJson;
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
        title: new Text('Urgencias'),
      ),
      body: new Center(
        child: _isLoading
            ? new CircularProgressIndicator()
            : new ListView.builder(
                itemCount: this.urgencias != null ? this.urgencias.length : 0,
                itemBuilder: (context, i) {
                  final urgencia = this.urgencias[i];
                  return new FlatButton(
                    padding: new EdgeInsets.all(0.0),
                    child: new Urgencia(urgencia),
                    onPressed: () => {},
                  );
                },
              ),
      ),
    );
  }
}
