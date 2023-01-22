import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pocketBaseProvider =
    StateNotifierProvider<PocketBaseNotifier, PocketBaseState>(
  (ref) => PocketBaseNotifier(),
);

@immutable
class PocketBaseState {
  const PocketBaseState();
}

class PocketBaseNotifier extends StateNotifier<PocketBaseState> {
  PocketBaseNotifier() : super(const PocketBaseState());
}
