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
  late final PocketBase _pb;

  @override
  DatabaseState build() {
    _pb = PocketBase('http://localhost:8090');
    return DatabaseState._(_pb);
  }

  Future<void> login({required username, required password}) async {
    await _pb.collection('users').authWithPassword(username, password);
    state = DatabaseState._(_pb);
  }
}
