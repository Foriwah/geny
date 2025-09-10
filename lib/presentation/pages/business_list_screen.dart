import 'package:flutter/material.dart';
import 'package:geny/presentation/provider/business_provider.dart';
import 'package:provider/provider.dart';

import 'package:geny/presentation/widgets/business_card.dart';
import 'package:geny/domain/entities/business_entity.dart';

class BusinessListScreen extends StatelessWidget {
  const BusinessListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BusinessProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Business List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: _buildBody(provider),
    );
  }

  Widget _buildBody(BusinessProvider provider) {
    switch (provider.state) {
      case BusinessState.loading:
        return const Center(child: CircularProgressIndicator());

      case BusinessState.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(provider.errorMessage),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: provider.retry,
                child: const Text('Retry'),
              ),
            ],
          ),
        );

      case BusinessState.empty:
        return const Center(child: Text('No businesses found.'));

      case BusinessState.loaded:
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: provider.businesses.length,
          itemBuilder: (context, index) {
            final BusinessEntity business = provider.businesses[index];
            return BusinessCard(business: business);
          },
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
