part of 'counter_cubit.dart';

//This will be the blueprint for all the possible states that will be emitted by the cubit
class CounterState {
  late int counterValue;
  bool wasIncremented;

  CounterState({
    required this.counterValue,
    required this.wasIncremented
  });
}
