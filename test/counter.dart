import 'package:drohealthtest/bloc/drug_quantity_cubit/drugquantity_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

counterTest() {
  // late CartCubit cartCubit;
  late CounterCubit counterCubit;

  setUp(() {
    EquatableConfig.stringify = true;
    // cartCubit = CartCubit();
    counterCubit = CounterCubit();
  });

  test('Quantity Cubit Counter', () {
    expect(counterCubit.state, 1);
    counterCubit.increment();
    expect(counterCubit.state, 2);
    counterCubit.decrement();
    expect(counterCubit.state, 1);
  });
  tearDown(() {
    counterCubit.close();
  });
}
