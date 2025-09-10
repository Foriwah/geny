import 'package:geny/domain/entities/business_entity.dart';
import 'package:geny/domain/repo/repo.dart';

class GetBusinessesUseCase {
  final BusinessRepository repository;

  GetBusinessesUseCase(this.repository);

  Future<List<BusinessEntity>> call() {
    return repository.fetchBusinesses();
  }
}
