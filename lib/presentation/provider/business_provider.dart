// lib/presentation/providers/business_provider.dart

import 'package:flutter/material.dart';
import 'package:geny/domain/entities/business_entity.dart';
import 'package:geny/domain/usecases/fetch_business_usecase.dart';

enum BusinessState { initial, loading, loaded, empty, error }

class BusinessProvider with ChangeNotifier {
  final GetBusinessesUseCase getBusinessesUseCase;

  BusinessProvider({required this.getBusinessesUseCase});

  BusinessState _state = BusinessState.initial;
  BusinessState get state => _state;

  List<BusinessEntity> _businesses = [];
  List<BusinessEntity> get businesses => _businesses;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> loadBusinesses() async {
    _state = BusinessState.loading;
    notifyListeners();

    try {
      final result = await getBusinessesUseCase.call();

      if (result.isEmpty) {
        _state = BusinessState.empty;
      } else {
        _businesses = result;
        _state = BusinessState.loaded;
      }
    } catch (e) {
      _errorMessage = e.toString();
      _state = BusinessState.error;
    }

    notifyListeners();
  }

  void retry() {
    loadBusinesses();
  }
}
