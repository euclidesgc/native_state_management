import 'package:flutter/material.dart';
import 'package:native_state_management/exemplo_page.dart';
import 'package:state_management/state_management.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/': (_) => const MyHomePage(title: 'Teste'),
        '/exemplo': (context) => const ExemploPage(),
      },
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
  @override
  Widget build(BuildContext context) {
    final counterState = CounterState(10);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.accessibility_rounded),
          onPressed: () => Navigator.pushNamed(context, '/exemplo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BaseStateWidget<CounterState, int>(
              state: counterState,
              builder: (state) {
                return Text(state.toString());
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  child: const Icon(Icons.exposure_minus_1),
                  onPressed: counterState.minus,
                ),
                OutlinedButton(
                  child: const Icon(Icons.plus_one),
                  onPressed: counterState.plus,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CounterState extends BaseState<int> {
  static CounterState instance = CounterState(0);

  CounterState(int init) : super(init);

  void plus() {
    state = state + 1;
  }

  void minus() {
    state = state - 1;
  }
}
