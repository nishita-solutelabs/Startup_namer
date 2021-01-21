import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyWidget(),
  ));
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
            child: Text(
          'Startup Name Generator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        )),
      ),
      body: Center(
        child: RandomWords(),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  //final wordPair = WordPair.random();
  final List<WordPair> _suggestions = <WordPair>[];

  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder: (BuildContext _context, int i) {
      if (i.isOdd) {
        return Divider(
          thickness: 5.0,
          color: Colors.grey[300],
        );
      } else {
        final int index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(pair.asUpperCase),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }
}
