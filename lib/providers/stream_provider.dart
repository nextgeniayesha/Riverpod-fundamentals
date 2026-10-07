import 'package:flutter_riverpod/flutter_riverpod.dart';


final tickerProvider = StreamProvider<int>((ref) {
  return Stream<int>.periodic(
    const Duration(seconds: 1),
    (count) => count + 1,
  );
});
