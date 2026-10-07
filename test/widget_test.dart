import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:riverpod_session/main.dart';

void main() {
  testWidgets('app starts on the Provider screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: RiverpodSessionApp()));
    expect(find.text('Ayesha'), findsOneWidget);
  });
}
