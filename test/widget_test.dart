import 'package:flutter_test/flutter_test.dart';

import 'package:weatherapp/main.dart';

void main() {
  testWidgets('global test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
  });
}
