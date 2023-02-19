import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  void update() {
    setState(() {
      leftButtonNumber = Random().nextInt(6) + 1;
      rightButtonNumber = Random().nextInt(6) + 1;
    });
  }

  int leftButtonNumber = 1;
  int rightButtonNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: FlatButton(
                    onPressed: () {
                      update();
                      print('Left Dice Number: $leftButtonNumber');
                    },
                    padding: EdgeInsets.all(0),
                    child: Image.asset('images/dice$leftButtonNumber.png'),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: FlatButton(
                    onPressed: () {
                      update();
                      print('Right Dice Number: $rightButtonNumber');
                    },
                    padding: EdgeInsets.all(0),
                    child: Image.asset('images/dice$rightButtonNumber.png'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          FlatButton(
            onPressed: () {
              update();
            },
            child: Text(
              'THROW',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.add,
              color: Colors.red,
            ),
            onPressed: () {
              update();
            },
          ),
        ],
      ),
    );
  }
}
