import 'package:flutter_test/flutter_test.dart';

import 'package:clothapp/main.dart';

void main() {
  testWidgets('starts on login and can navigate to and from register', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const LuxeApp());

    expect(find.text('Login'), findsNWidgets(2));
    expect(find.text('Email Address'), findsOneWidget);

    await tester.tap(find.text('Create a new account'));
    await tester.pumpAndSettle();

    expect(find.text('Create Account'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);

    await tester.tap(find.byTooltip('Back to login'));
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsNWidgets(2));
  });
}
