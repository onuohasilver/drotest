import 'package:bloc_test/bloc_test.dart';
import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';
import 'package:drohealthtest/customMethods/cartMethods/getCartList.dart';
import 'package:drohealthtest/customMethods/cartMethods/getNumberOfItems.dart';
import 'package:drohealthtest/customMethods/cartMethods/getTotalCartAmount.dart';
import 'package:drohealthtest/models/drugModel.dart';
import 'package:drohealthtest/utilities/mockdata.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

cartTest() {
  late CartCubit cartCubit;
  // late CounterCubit counterCubit;

  setUp(() {
    EquatableConfig.stringify = true;
    cartCubit = CartCubit();
    // counterCubit = CounterCubit();
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

    ///Check for the number of a specific item in the cart
    expect(
        getNumberInCart(
            cartCubit.state, DrugModel.fromJson(MockData.drugs[0]).name),
        1);

    ///Check total Amount of cart
    expect(getTotalCartAmount(cartCubit.state), 1650);

    ///Retrieve all the cart items are their corresponding number of occurences
    expect(getMappedCartList(cartCubit.state), {
      DrugModel.fromJson(MockData.drugs[0]): 1,
      DrugModel.fromJson(MockData.drugs[1]): 1,
    });

    ///Remove an item from the cart
    cartCubit.removeFromCart(DrugModel.fromJson(MockData.drugs[1]));

    ///Check if the removed Item has reflected
    expect(getMappedCartList(cartCubit.state),
        {DrugModel.fromJson(MockData.drugs[0]): 1});
  });
  tearDown(() {
    cartCubit.close();
  }); 
}
