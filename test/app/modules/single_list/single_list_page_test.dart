import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:shopping_list_mobx/app/modules/single_list/single_list_page.dart';

main() {
  testWidgets('SingleListPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(SingleListPage(title: 'SingleList')));
    final titleFinder = find.text('SingleList');
    expect(titleFinder, findsOneWidget);
  });
}
