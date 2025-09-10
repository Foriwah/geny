// lib/domain/entities/business_entity.dart

import 'package:equatable/equatable.dart';

class BusinessEntity extends Equatable {
  final String name;
  final String location;
  final String contact;

  const BusinessEntity({
    required this.name,
    required this.location,
    required this.contact,
  });

  @override
  List<Object?> get props => [name, location, contact];
}
