import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SplashLocalDatasource {
  bool get isLoggedIn;

  bool get hasSeenOnboarding;
}

class SplashLocalDatasourceImpl implements SplashLocalDatasource {
  final SupabaseClient _client;

  SplashLocalDatasourceImpl(this._client);

  @override
  bool get isLoggedIn => _client.auth.currentSession !=null;

  @override
  bool get hasSeenOnboarding {
    final meta = _client.auth.currentUser?.userMetadata;
    return meta?['onboarding_done'] == true;
  }
}
