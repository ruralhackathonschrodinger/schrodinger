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
              urgencia['nombre'] != ''
                  ? new Text(urgencia['nombre'])
                  : new Text('Urgencia sin nombre.'),
              new Container(height: 8.0),
              urgencia['telefono'] != ''
                  ? new Text('Tel. ' + urgencia['telefono'],
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold))
                  : new Text('Urgencia sin teléfono.'),
              new Container(height: 8.0),
              urgencia['direccion'] != ''
                  ? new Text('C. ' + urgencia['direccion'])
                  : new Text('Urgencia sin dirección.')
            ],
          ),
        ),
        new Divider()
      ],
    );
  }
}
