import 'package:flutter/material.dart';
import 'package:geny/data/datasource/remote_datasource.dart';
import 'package:geny/data/repo/repo_impl.dart';
import 'package:geny/domain/usecases/fetch_business_usecase.dart';
import 'package:geny/mock_dio.dart';
import 'package:geny/presentation/pages/business_list_screen.dart';
import 'package:geny/presentation/provider/business_provider.dart';
import 'package:provider/provider.dart';

void main() {
  final dio = createMockDio();
  final remoteDataSource = BusinessRemoteDataSourceImpl(dio: dio);
  final repository = BusinessRepositoryImpl(remoteDataSource: remoteDataSource);
  final getBusinessesUseCase = GetBusinessesUseCase(repository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (_) =>
                  BusinessProvider(getBusinessesUseCase: getBusinessesUseCase)
                    ..loadBusinesses(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BusinessListScreen(),
    );
  }
}
