import 'package:flutter/material.dart';

class Urgencias extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _UrgenciasState();
  }
}

class _UrgenciasState extends State<Urgencias> {
  var eventos;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('Urgencias'),
      ),
    );
  }
}
