import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/profile_state.dart';


// To change one field we use copyWith.
final profileProvider = StateProvider<ProfileState>((ref) {
  return const ProfileState();
});
