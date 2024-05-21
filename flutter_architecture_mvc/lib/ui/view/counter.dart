import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_mvc/domain/model/counter_mode.dart';
import 'package:flutter_architecture_mvc/presentation/view_model/counter.dart';
import 'package:flutter_architecture_mvc/presentation/view_model/counter_mode.dart';

// TODO: Clean Architecture 패턴을 적용하여 카운터 앱이 동작하도록 변경하기
// - 단, View 내에 변수는 없어야 한다. (ex. counter)

class CounterView extends StatelessWidget {
  final CounterViewModel counterViewModel;
  final CounterModeViewModel counterModeViewModel;

  const CounterView(
      {super.key,
      required this.counterViewModel,
      required this.counterModeViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('MVVM'),
        actions: [
          IconButton(
            onPressed: onChangeMode,
            icon: const Icon(CupertinoIcons.arrow_2_squarepath),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder(
              valueListenable: counterViewModel.counter,
              builder: (context, counter, child) => Text(
                counterViewModel.counter.value.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: execute,
          child: ValueListenableBuilder<CounterMode>(
            valueListenable: counterModeViewModel.counterMode,
            builder: (context, counterMode, child) => Icon(counterMode.icon),
          )),
    );
  }

  void onChangeMode() {
    counterModeViewModel.toggleMode();
  }

  void execute() {
    switch (counterModeViewModel.counterMode.value) {
      case CounterMode.plus:
        counterViewModel.increment();
      case CounterMode.minus:
        counterViewModel.decrement();
    }
  }
}

extension on CounterMode {
  IconData get icon {
    switch (this) {
      case CounterMode.plus:
        return CupertinoIcons.add;
      case CounterMode.minus:
        return CupertinoIcons.minus;
    }
  }
}
