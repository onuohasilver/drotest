import 'package:bloc_test/bloc_test.dart';
import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';
import 'package:drohealthtest/customMethods/cartMethods/getNumberOfItems.dart';
import 'package:drohealthtest/customMethods/cartMethods/getTotalCartAmount.dart';
import 'package:drohealthtest/models/drugModel.dart';
import 'package:drohealthtest/utilities/mockdata.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('DroHealth Tests', () {
    late CartCubit cartCubit;

    setUp(() {
      EquatableConfig.stringify = true;
      cartCubit = CartCubit();
    });

    blocTest<CartCubit, CartState>(
      'emits ProductAdded when Drug is added.',
      build: () => cartCubit,
      act: (cubit) => cubit.addToCart(DrugModel.fromJson(MockData.drugs[0])),
      expect: () => <CartState>[
        ProductAdded([DrugModel.fromJson(MockData.drugs[0])])
      ],
    );
    test('Test Custom Cart Methods', () {
      ///Mock an addition to the cart
      cartCubit.addToCart(DrugModel.fromJson(MockData.drugs[0]));
      cartCubit.addToCart(DrugModel.fromJson(MockData.drugs[1]));
      expect(
          getNumberInCart(
              cartCubit.state, DrugModel.fromJson(MockData.drugs[0]).name),
          1);
      expect(getTotalCartAmount(cartCubit.state), 1650);
    });

    // blocTest<CartCubit, CartState>(
    //   'emits ProductRemoved when Drug is removed.',
    //   build: () => cartCubit,
    //   act: (cubit) =>
    //       cubit.removeFromCart(DrugModel.fromJson(MockData.drugs[0])),
    //   expect: () => <CartState>[ProductRemoved([])],
    // );

    // test('Test Counter', () {
    //   expect(
    //       getNumberInCart(
    //           cartCubit.state, DrugModel.fromJson(MockData.drugs[0]).name),
    //       1);
    // });

    tearDown(() {
      cartCubit.close();
    });
  });
}
