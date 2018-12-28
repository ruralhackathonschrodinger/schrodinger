import 'package:flutter/material.dart';

class Urgencia extends StatelessWidget {
  final urgencia;

  Urgencia(this.urgencia);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            children: <Widget>[
              urgencia['logo'] != null
                  ? new Image.network(urgencia['logo'])
                  : new Text('Urgencia sin logo.'),
              new Container(height: 8.0),
              urgencia['nombre'] != null
                  ? new Text(urgencia['nombre'])
                  : new Text('Urgencia sin nombre.'),
              new Container(height: 8.0),
              urgencia['telefono'] != null
                  ? new Text(urgencia['telefono'],
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold))
                  : new Text('Urgencia sin teléfono.'),
              new Container(height: 8.0),
              urgencia['direccion'] != null
                  ? new Text(urgencia['direccion'])
                  : new Text('Urgencia sin dirección.')
            ],
          ),
        ),
        new Divider()
      ],
    );
  }
}
