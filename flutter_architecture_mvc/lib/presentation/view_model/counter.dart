import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_mvc/domain/model/counter.dart';

class CounterViewModel {
  final CounterModel _counterModel;

  CounterViewModel(this._counterModel);

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<int> get counter => _counter;

  void increment() {
    _counterModel.increment();
    _update();
  }

  void decrement() {
    _counterModel.decrement();
    _update();
  }

  void _update() {
    _counter.value = _counterModel.counter;
  }
}
