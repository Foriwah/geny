import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

Dio createMockDio() {
  final dio = Dio();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (options.path == '/businesses') {
          final jsonString = await rootBundle.loadString(
            'assets/data/businesses.json',
          );
          final data = json.decode(jsonString);
          return handler.resolve(
            Response(requestOptions: options, data: data, statusCode: 200),
          );
        }

        return handler.next(options);
      },
    ),
  );

  return dio;
}
