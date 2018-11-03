import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const url =
    "https://api.hgbrasil.com/finance/quotations?format=json&key=ebd6dea8";

void main() async {
  runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(hintColor: Colors.amber, primaryColor: Colors.white)));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final bitcoinController = TextEditingController();

  double dolar;
  double euro;
  double bitcoin;

  int fractionDigits = 2;

  void _realChanged(String text) {
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(fractionDigits);
    euroController.text = (real / euro).toStringAsFixed(fractionDigits);
    bitcoinController.text = (real / bitcoin).toStringAsFixed(fractionDigits);
  }

  void _dolarChanged(String text) {
    double dolar = double.parse(text);
    // para pegar a variavel dolar de cima deveria ser this.dolar
    realController.text = (dolar * this.dolar).toStringAsFixed(fractionDigits);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(fractionDigits);
    bitcoinController.text = (dolar * this.dolar / bitcoin).toStringAsFixed(fractionDigits);
  }

  void _euroChanged(String text) {
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(fractionDigits);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(fractionDigits);
    bitcoinController.text = (euro * this.euro / bitcoin).toStringAsFixed(fractionDigits);
  }

  void _bitcoinChanged(String text) {
    double bitcoin = double.parse(text);
    realController.text = (bitcoin * this.bitcoin).toStringAsFixed(fractionDigits);
    dolarController.text = (bitcoin * this.bitcoin / dolar).toStringAsFixed(fractionDigits);
    euroController.text = (bitcoin * this.bitcoin / euro).toStringAsFixed(fractionDigits);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  "Carregando dados...",
                  style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Erro ao carregar dados :(",
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                bitcoin = snapshot.data["results"]["currencies"]["BTC"]["buy"];
                return SingleChildScrollView(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(
                        Icons.monetization_on,
                        size: 150.0,
                        color: Colors.amber,
                      ),
                      buildTextField(
                          "Reais", "R\$ ", realController, _realChanged),
                      Divider(),
                      buildTextField(
                          "Dólares", "U\$\$ ", dolarController, _dolarChanged),
                      Divider(),
                      buildTextField(
                          "Euros", "€ ", euroController, _euroChanged),
                      Divider(),
                      buildTextField(
                          "BitCoin", "Ƀ ", bitcoinController, _bitcoinChanged),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

Widget buildTextField(String labelCurrency, String prefix,
    TextEditingController controller, Function function) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
        labelText: labelCurrency,
        labelStyle: TextStyle(color: Colors.amber),
        border: OutlineInputBorder(),
        prefixText: prefix),
    style: TextStyle(color: Colors.amber, fontSize: 25.0),
    onChanged: function,
    keyboardType: TextInputType.number,
  );
}

Future<Map> getData() async {
  http.Response response = await http.get(url);
  return json.decode(response.body);
}
