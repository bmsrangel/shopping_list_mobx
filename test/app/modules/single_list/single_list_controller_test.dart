import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:shopping_list_mobx/app/modules/single_list/single_list_controller.dart';
import 'package:shopping_list_mobx/app/modules/single_list/single_list_module.dart';

void main() {
  initModule(SingleListModule());
  SingleListController singlelist;

  setUp(() {
    singlelist = SingleListModule.to.get<SingleListController>();
  });

  group('SingleListController Test', () {
    test("First Test", () {
      expect(singlelist, isInstanceOf<SingleListController>());
    });

    test("Set Value", () {
      expect(singlelist.value, equals(0));
      singlelist.increment();
      expect(singlelist.value, equals(1));
    });
  });
}
