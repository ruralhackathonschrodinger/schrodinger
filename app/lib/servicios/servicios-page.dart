import 'package:flutter/material.dart';
import './restaurantes-page.dart';
import './hoteles-page.dart';
import './transportes-page.dart';
import './comunicaciones-page.dart';

class Servicios extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _ServiciosState();
  }
}

class _ServiciosState extends State<Servicios> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('Servicios'),
      ),
      body: new Container(
          child: new ListView(
        children: <Widget>[
          new Container(
            height: 20.0,
          ),
          FlatButton(
            onPressed: () => Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new Restaurantes())),
            padding: EdgeInsets.all(50.0),
            child: Row(
              // Replace with a Row for horizontal icon + text
              children: <Widget>[
                Icon(Icons.local_pizza),
                Text(' Restaurantes',
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          new Container(
            height: 10.0,
          ),
          FlatButton(
            onPressed: () => Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Hoteles())),
            padding: EdgeInsets.all(50.0),
            child: Row(
              // Replace with a Row for horizontal icon + text
              children: <Widget>[
                Icon(Icons.hotel),
                Text(' Hoteles',
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          new Container(
            height: 10.0,
          ),
          FlatButton(
            onPressed: () => Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Transportes())),
            padding: EdgeInsets.all(50.0),
            child: Row(
              // Replace with a Row for horizontal icon + text
              children: <Widget>[
                Icon(Icons.directions_bus),
                Text(' Transporte',
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          new Container(
            height: 10.0,
          ),
          FlatButton(
            onPressed: () => Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new Comunicaciones())),
            padding: EdgeInsets.all(50.0),
            child: Row(
              // Replace with a Row for horizontal icon + text
              children: <Widget>[
                Icon(Icons.radio),
                Text(' Comunicaciones',
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          new Container(
            height: 8.0,
          ),
        ],
      )),
    );
  }
}
