// The profile state: 2 fields in one object.
class ProfileState {
  const ProfileState({
    this.name = '',
    this.isOnline = false,
  });

  final String name;
  final bool isOnline;

  // copyWith = make a NEW object, change only the fields you pass.
  // ?? means: if you did not pass it, keep the old value.
  ProfileState copyWith({
    String? name,
    bool? isOnline,
  }) {
    return ProfileState(
      name: name ?? this.name,
      isOnline: isOnline ?? this.isOnline,
    );
  }
}
