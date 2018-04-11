import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  List<bool> _data = new List<bool>();

  @override
  void initState() {
    setState(() {
      for (int i = 0; i < 10; i++) {
        _data.add(false);
      }
    });
  }

  void onChanged(bool value, int index) {
    setState(() {
      _data[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('List View Demo'),
      ),
      body: new ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new Container(
                padding: new EdgeInsets.all(5.0),
                child: new Column(
                  children: <Widget>[
                    new Text('This is item'),
                    new CheckboxListTile(
                        value: _data[index],
                        controlAffinity: ListTileControlAffinity.leading,
                        title: new Text('Click me item${index}'),
                        onChanged: (bool value) {
                          onChanged(value, index);
                        })
                  ],
                ),
              ),
            );
          }),
    );
  }
}
