import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:salamtak/core/constants/supabase_config.dart';
import 'package:salamtak/features/home/data/models/doctor_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<DoctorModel>> getPopularDoctors();

  Future<List<DoctorModel>> getDoctorsBySpecialty(String specialty);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final SupabaseClient _client;

  HomeRemoteDataSourceImpl(this._client);

  @override
  Future<List<DoctorModel>> getPopularDoctors() async {
    final data = await _client
        .from(SupabaseConfig.doctorsTable)
        .select('*')
        .order('rating', ascending: false)
        .limit(10);
    return (data as List)
        .map((r) => DoctorModel.fromMap(r as Map<dynamic, dynamic>))
        .toList();
  }

  @override
  Future<List<DoctorModel>> getDoctorsBySpecialty(String specialty) async {
    final data = await _client
        .from(SupabaseConfig.doctorsTable)
        .select('*, profiles!inner(email, username)')
        .eq('specialty', specialty);
    return (data as List)
        .map((r) => DoctorModel.fromMap(r as Map<String, dynamic>))
        .toList();
  }
}
