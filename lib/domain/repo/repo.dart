import 'package:geny/domain/entities/business_entity.dart';

abstract class BusinessRepository {
  Future<List<BusinessEntity>> fetchBusinesses();
}
