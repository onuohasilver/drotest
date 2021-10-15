import 'package:flutter_test/flutter_test.dart';

import 'cart.dart';
import 'counter.dart';
import 'search.dart';

main() {
  group('DroHealth Tests', () {
    counterTest();
    cartTest();
    searchTest();
  });
}
