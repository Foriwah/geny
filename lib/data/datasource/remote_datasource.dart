import 'package:dio/dio.dart';

import 'package:geny/data/models/business_model.dart';
import 'package:geny/domain/entities/business_entity.dart';

abstract class BusinessRemoteDataSource {
  Future<List<BusinessEntity>> fetchBusinesses();
}

class BusinessRemoteDataSourceImpl implements BusinessRemoteDataSource {
  final Dio dio;

  BusinessRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<BusinessEntity>> fetchBusinesses() async {
    try {
      // Simulate API delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Use Dio to simulate a request (e.g., hitting a mock/local endpoint)
      final response = await dio.get('/businesses');

      final data = response.data;

      if (data is List) {
        return data
            .map((jsonItem) => BusinessModel.fromJson(jsonItem))
            .toList();
      } else {
        throw Exception('Unexpected data format');
      }
    } catch (e) {
      throw Exception('Failed to load businesses: $e');
    }
  }
}
