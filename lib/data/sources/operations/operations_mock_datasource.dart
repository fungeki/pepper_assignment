import 'dart:convert';
import 'dart:developer';

import 'package:assignment_pepper/data/sources/operations/mappers/json_to_operation_mapper.dart';
import 'package:assignment_pepper/domain/entities/home_operations/basic_operation_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_cash_withdrawal_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_charge_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_refund_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_salary_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_saving_withdrawal_model.dart';
import 'package:flutter/services.dart';

class OperationsMockDatasource {
  final mockJson = "assets/mocks/mock_operations.json";

  Future<List<BasicOperationModel>> getOperations() async {
    try {
      final mockData = await rootBundle.loadString(mockJson);
      final json = jsonDecode(mockData);
      log(json.toString(), name: "mockJSon");
      final operationsJsonList = json["operations"] as List;
      final operations = operationsJsonList
          .map((operationJson) => BasicOperationsMapper.toOperationsModel(
              operationJson as Map<String, dynamic>))
          .whereType<BasicOperationModel>().toList();
      log(operations.toString());
      return operations;
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
    }
    return [];
  }
}
