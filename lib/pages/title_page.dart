import 'package:flutter/material.dart';
import '../ui/answer_button_multi.dart';

class TitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget gridSection = new Expanded(
      flex: 1,
      child: new GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: List<String>.map((String value) {
            return _displayGridItem(value);
          }).toList()),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Example 2 Page"),
      ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: body,
      ),
    );
  }
}