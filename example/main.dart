import 'package:flutter/material.dart';
import 'package:tag_highlighting/tag_highlighting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tag Highlighting',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Color(0xFFEBEBEB),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("tag_highlighting")),
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TagHighlighting(
        text:
            "Hello, <strong>World</strong> ! How <em>are you</em> ? <how>Extremely fine</how> !",
        defaultTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
        tags: [
          TagHighlight(
            tagName: "strong", // the name of the tag above.
            textStyle: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.redAccent,
              fontSize: 16,
            ), // the style of "you".
          ),
          TagHighlight(
            tagName: "em",
            textStyle: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.blueAccent,
              fontSize: 16,
            ),
          ),
          TagHighlight(
            tagName: "how",
            textStyle: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.orangeAccent,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
