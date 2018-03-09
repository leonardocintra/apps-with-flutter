import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new ProporNome());

class ProporNome extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){

    return new MaterialApp(
      title: 'Startup Gerador de Nome',
      home: new PalavraAleatoria()
    );
  }
}

class PalavraAleatoria extends StatefulWidget{
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<PalavraAleatoria>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return new Divider();
        }

        final index = i ~/ 2;
        if (index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      ),
    );
  }

  @override
  Widget build (BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Iniciar nome do gerador'),
      ),
      body: _buildSuggestions(),
    );
  }
}
