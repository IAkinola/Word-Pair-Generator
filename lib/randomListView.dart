import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomListViewState();
  }
}

class RandomListViewState extends State<RandomListView> {
  final _randomWordPairs = <WordPair>[];
  final savedWordPairs = Set<WordPair>();

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, item) {
          if (item.isOdd)
            return Divider(
              color: Colors.purple[500],
            );

          final index = item ~/ 2;

          if (index >= _randomWordPairs.length) {
            _randomWordPairs.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_randomWordPairs[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = savedWordPairs.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 15.0),
      ),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.purple : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            savedWordPairs.remove(pair);
          } else {
            savedWordPairs.add(pair);
          }
        });
      },
    );
  }

  Widget build(BuildContext context) {
    return _buildList();
  }
}
