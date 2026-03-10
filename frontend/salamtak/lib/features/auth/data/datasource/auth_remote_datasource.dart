import 'package:salamtak/core/constants/supabase_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDatasource {
  Future<void> logIn({required String email, required String password});

  Future<void> signup({
    required String email,
    required String password,
    required String username,
  });

  Future<void> logOut();

  bool get isLoggedIn;

  String? get currentUserId;
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final SupabaseClient _client;

  AuthRemoteDatasourceImpl(this._client);

  @override
  String? get currentUserId => _client.auth.currentUser?.id;

  @override
  bool get isLoggedIn => _client.auth.currentSession != null;

  @override
  Future<void> logIn({required String email, required String password}) async {
    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (response.user == null)
      throw Exception('Login failed: no user returned');
  }

  @override
  Future<void> logOut() => _client.auth.signOut();

  @override
  Future<void> signup({
    required String email,
    required String password,
    required String username,
  }) async {
    final response = await _client.auth.signUp(
      email: email,
      password: password,
      data: {'username': username},
    );
    if (response.user == null) throw Exception('Signup failed');
    await _client.from(SupabaseConfig.patientsTable).insert({
      'user_id': response.user!.id,
      'username': username,
      'email': email,
    });
  }
}
