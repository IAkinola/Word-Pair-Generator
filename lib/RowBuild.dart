import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

abstract class RowBuild extends StatelessWidget {
  Widget buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }
}

//research abstract classes and how to intitialise, setstate(), actions widget, map funtion