import 'package:advance_text_field/advance_text_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advance TextField Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Advance TextField Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AdvanceTextField(
              type: AdvanceTextFieldType.EDIT,
              editLabel: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              saveLabel: Icon(
                Icons.check,
                color: Colors.white,
              ),
              textHint: 'Something...',
              onEditTap: () {},
              onSaveTap: (text) {
                print('value is: $text');
              },
            )
          ],
        ),
      ),
    );
  }
}
