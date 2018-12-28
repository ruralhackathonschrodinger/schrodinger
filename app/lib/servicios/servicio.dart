import 'package:flutter/material.dart';

class Servicio extends StatelessWidget {
  final servicio;

  Servicio(this.servicio);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            children: <Widget>[
              servicio['logo'] != null
                  ? new Image.network(servicio['logo'])
                  : new Text('Servicio sin logo.'),
              new Container(height: 8.0),
              servicio['nombre'] != null
                  ? new Text(servicio['nombre'])
                  : new Text('Servicio sin nombre.'),
              new Container(height: 8.0),
              servicio['telefono'] != null
                  ? new Text(servicio['telefono'],
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold))
                  : new Text('Servicio sin teléfono.'),
              new Container(height: 8.0),
              servicio['direccion'] != null
                  ? new Text(servicio['direccion'])
                  : new Text('Servicio sin dirección.')
            ],
          ),
        ),
        new Divider()
      ],
    );
  }
}
