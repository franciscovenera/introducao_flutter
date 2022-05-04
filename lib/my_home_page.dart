import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _incrementando = true;
  int _contador = 0;
  List<int> _historico = [];
  int _total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Flutter Demo Página Inicial',
              style: TextStyle(color: Colors.white))),

      drawer: _buildDrawer(),

      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementarOuDecrementar,
        tooltip: _incrementando ? 'Incrementar' : 'Decrementar',
        child: _incrementando ? Icon(Icons.add) : Icon(Icons.remove),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Center _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Contador:',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            '$_contador',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 20.0),
          Text(
            'Histórico:',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(_historico.isEmpty ? 'Vazio' : _historico.join(' - '),
          style: TextStyle(fontSize: 20.0, color: Colors.grey.shade600))
          ),
          Text(
            'Soma total:',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            '$_total',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: const Text(
              'Selecione',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.clear),
            title: const Text('Zerar contador'),
            onTap: _zerar,
          ),
          ListTile(
            leading: const Icon(Icons.swap_calls),
            title: const Text('Inverter contador'),
            onTap: _inverter,
          ),
          ListTile(
            leading: const Icon(Icons.memory),
            title: const Text('Memorizar contador'),
            onTap: _memorizar,
          ),
        ],
      ),
    );
  }

  void _incrementarOuDecrementar() {
    setState(() {
      if (_incrementando){
        _contador++;
      } else {
        _contador--;
      }

    });
  }

  void _zerar() {
    Navigator.of(context).pop();
    setState(() {
      _contador = 0;
      _historico.clear();
      _total = 0;
    });
  }

  void _inverter() {
    Navigator.of(context).pop();
    setState(() {
      _incrementando = !_incrementando;
    });
  }

  void _memorizar() {
    Navigator.of(context).pop();
    setState(() {
      _historico.add(_contador);
      _total = _historico.isEmpty ? 0 : _historico.reduce((a, b) => a + b);
    });
  }

}
