import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture_mvc/domain/model/counter.dart';
import 'package:flutter_architecture_mvc/domain/model/counter_mode.dart';
import 'package:flutter_architecture_mvc/presentation/view_model/counter.dart';
import 'package:flutter_architecture_mvc/presentation/view_model/counter_mode.dart';
import 'package:flutter_architecture_mvc/ui/view/counter.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CounterView(
        counterViewModel: CounterViewModel(CounterModel()),
        counterModeViewModel: CounterModeViewModel(CounterModeModel()),
      ),
    );
  }
}
