import 'package:flutter/material.dart';

class Evento extends StatelessWidget {
  final evento;

  Evento(this.evento);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            children: <Widget>[
              evento['foto'] != ''
                  ? new Image.network(evento['foto'])
                  : new Text('Evento sin imagen.'),
              new Container(height: 8.0),
              new Text(
                  evento['nombre'] != ''
                      ? evento['nombre']
                      : 'Evento sin título.',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        new Divider()
      ],
    );
  }
}