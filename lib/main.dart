import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/counter.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ChangeNotifierProvider<Counter>(
            create: (context) => Counter(),
            child: Column(
              children: <Widget>[CustomWidget(), CustomWidget2()],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final value = Provider.of<Counter>(context, listen: true).number;
    return Text(
      value.toString(),
      style: TextStyle(fontSize: 50),
    );
  }
}

class CustomWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return RaisedButton(
      color: counter.number % 2 == 0 ? Colors.green : Colors.blue,
      child: Text('Click'),
      onPressed: () {
        counter.increment();
        print(counter.number);
      },
    );
  }
}
