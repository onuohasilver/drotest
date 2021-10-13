import 'package:bloc/bloc.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class CartCubit extends Cubit<List> {
  /// {@macro counter_cubit}
  CartCubit() : super([]);

  /// Add 1 to the current state.
  void add(String data) {
    state.add(data);

    emit(state);
  }

  /// Subtract 1 from the current state.
  void remove(String data) {
    state.remove(data);
    emit(state);
  }
}
