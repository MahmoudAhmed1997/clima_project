import 'package:flutter/material.dart';

class city extends StatefulWidget {
  @override
  _cityState createState() => _cityState();
}

class _cityState extends State<city> {
  String cityName ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              filled: true,
            ),onChanged: (value){
              cityName =value ;
          },
          ),
          FlatButton(onPressed: (){Navigator.pop(context, cityName);}, child: Text('Get Weather'))
        ],
      ),
    );
  }
}
