import 'package:flutter_bloc_concepts/counter_cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  //group is used to organise multiple test for a feature
  group('CounterCubit', (){
    CounterCubit counterCubit;

    setUp((){
      counterCubit = CounterCubit();
    });
  });
}