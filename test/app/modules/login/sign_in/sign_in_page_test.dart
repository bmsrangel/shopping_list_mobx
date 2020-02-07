import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:shopping_list_mobx/app/modules/login/sign_in/sign_in_page.dart';

main() {
  testWidgets('SignInPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(SignInPage(title: 'SignIn')));
    final titleFinder = find.text('SignIn');
    expect(titleFinder, findsOneWidget);
  });
}