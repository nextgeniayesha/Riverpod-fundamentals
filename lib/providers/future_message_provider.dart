import 'package:flutter_riverpod/flutter_riverpod.dart';


final delayedMessageProvider = FutureProvider<String>((ref) async {
  await Future<void>.delayed(const Duration(seconds: 2));
  throw "Internet failed";
  // return 'Future complete';
});
