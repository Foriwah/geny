import 'package:geny/domain/entities/business_entity.dart';

class BusinessModel extends BusinessEntity {
  const BusinessModel({
    required super.name,
    required super.location,
    required super.contact,
  });
  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      name: json['biz_name'] as String,
      location: json['bss_location'] as String,
      contact: json['contct_no'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'biz_name': name, 'bss_location': location, 'contct_no': contact};
  }
}
