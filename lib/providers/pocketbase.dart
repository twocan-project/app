import 'package:flutter/foundation.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pocketbase.g.dart';

@immutable
class User {
  final String name;

  const User({required this.name});
}

class DatabaseState {
  late final User? user;

  DatabaseState._(PocketBase pb) {
    user = pb.authStore.isValid ? pb.authStore.model : null;
  }
}

@riverpod
class Database extends _$Database {
  @override
  Future<DatabaseState> build() async {
    final pb = PocketBase('http://localhost:8090');
    return DatabaseState._(pb);
  }
}
