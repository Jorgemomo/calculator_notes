//Jorge Armando Morales Mora
//cc 1017124603

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cálculadora de notas',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home:  const MyHomePage(title: 'CALCULA TU NOTA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _nota1 = TextEditingController();
  final _nota2 = TextEditingController();
  final _nota3 = TextEditingController();
  final _nota4 = TextEditingController();

  double _total = 0;
  String _totalRound = '';
  final _amountNotes = 4;
  String _message = '';

  void _calculeNote() {
    setState(() {
      _total = (double.parse(_nota1.text) + double.parse(_nota2.text) + double.parse(_nota3.text) + double.parse(_nota4.text)) / _amountNotes;
      _totalRound = _total.toStringAsFixed(2);
      if(_total>=3.0 && _total <=5.0){
        _message = 'Su nota final es: $_totalRound  ¡APROBASTE!';
      }
      else
      if(_total >=0.0 && _total <= 2.9){
        _message = 'Su nota final es: $_totalRound  ¡REPROBASTE!';
      }
      else{
        _message = 'Ingrese valores adecuados para sus notas';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold))),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 104, 127, 158),
          image: DecorationImage(image: const NetworkImage('https://is4-ssl.mzstatic.com/image/thumb/Purple113/v4/cc/48/19/cc48195d-0252-e398-4991-8796b3253fd6/AppIcon-1x_U007emarketing-0-7-0-85-220.png/512x512bb.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.dstATop),),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Bienvenid@ a la calculadora de notas, ingresa tus notas:',
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
                  controller: _nota1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite la primera nota',
                    labelStyle: TextStyle(color:Colors.amber, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
                  controller: _nota2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite la segunda nota',
                      labelStyle: TextStyle(color:Colors.amber, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
                  controller: _nota3,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite la tercera nota',
                      labelStyle: TextStyle(color:Colors.amber, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
                  controller: _nota4,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite la cuarta nota',
                      labelStyle: TextStyle(color:Colors.amber, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            _calculeNote();
                          },
                          child: const Text('Nota final',
                            style: TextStyle(fontWeight: FontWeight.bold),)),
                    ]),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  _message,
                  style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}