import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PractiseRoute extends StatelessWidget{
  const PractiseRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("實驗室"),
      ),
      body:Text("實驗中"),
    );
  }
}

