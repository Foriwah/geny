import 'package:flutter/material.dart';
import 'package:geny/domain/entities/business_entity.dart';

class BusinessCard extends StatelessWidget {
  final BusinessEntity business;
  const BusinessCard({super.key, required this.business});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(business.name),
        subtitle: Text(business.location),
        trailing: IconButton(
          icon: const Icon(Icons.keyboard_arrow_right),
          onPressed: () {
            // Navigate to business details
          },
        ),
      ),
    );
  }
}
