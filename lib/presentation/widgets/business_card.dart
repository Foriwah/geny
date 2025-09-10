import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('Business 1'),
        subtitle: const Text('Description of Business 1'),
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
