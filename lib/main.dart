import 'package:assignment_pepper/app.dart';
import 'package:assignment_pepper/core/network_manager.dart';
import 'package:assignment_pepper/data/repositories/operations_repository.dart';
import 'package:assignment_pepper/data/sources/operations/operations_mock_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiRepositoryProvider(providers: [
    ///
    /// Services
    ///
    RepositoryProvider<NetworkManager>(
      create: (context) => NetworkManager(),
    ),


  ], child: PepperAssignmentApp()));
}
