import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './randomListView.dart';

class PushSaved extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.list),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          final Iterable<ListTile> tiles = RandomListViewState().savedWordPairs.map((WordPair pair) {
            return ListTile(
                title: Text(
              pair.asPascalCase,
              style: TextStyle(fontSize: 15.0),
            ));
          });

          final List<Widget> divided =
              ListTile.divideTiles(context: context, tiles: tiles).toList();

          return Scaffold(
              appBar: AppBar(
                title: Text('Saved WordPairs'),
              ),
              body: ListView(children: divided));
        }));
      },
    );
  }
}
