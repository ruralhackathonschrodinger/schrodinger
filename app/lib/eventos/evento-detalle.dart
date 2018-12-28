import 'package:flutter/material.dart';

class EventoDetalle extends StatelessWidget {
  final evento;

  EventoDetalle(this.evento);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(evento['nombre'] != null
              ? evento['nombre']
              : 'Evento sin título.'),
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.all(16.0),
                child: new Column(
                  children: <Widget>[
                    new Container(height: 20.0),
                    evento['fecha'] != null
                        ? new Text(evento['fecha'],
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold))
                        : 'Evento sin fecha',
                    new Container(height: 20.0),
                    evento['foto'] != null
                        ? new Image.network(evento['foto'])
                        : new Text('Aviso o noticia sin imagen.'),
                    new Container(height: 20.0),
                    new Text(
                        evento['descripcion'] != null
                            ? evento['descripcion']
                            : 'Evento sin texto.',
                        textAlign: TextAlign.justify,
                        style: new TextStyle(fontSize: 16.0, height: 1.5))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
