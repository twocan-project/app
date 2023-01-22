import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pocketbase.g.dart';

@immutable
class DatabaseState {
  const DatabaseState();
}

@riverpod
class Database extends _$Database {
  @override
  DatabaseState build() => const DatabaseState();
}
