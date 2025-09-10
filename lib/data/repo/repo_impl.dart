// lib/data/repositories/business_repository_impl.dart

import 'package:geny/data/datasource/remote_datasource.dart';
import 'package:geny/domain/entities/business_entity.dart';
import 'package:geny/domain/repo/repo.dart';

class BusinessRepositoryImpl implements BusinessRepository {
  final BusinessRemoteDataSource remoteDataSource;

  BusinessRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<BusinessEntity>> fetchBusinesses() {
    return remoteDataSource.fetchBusinesses();
  }
}
