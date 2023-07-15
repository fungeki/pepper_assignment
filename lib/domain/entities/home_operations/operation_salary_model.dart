import 'package:assignment_pepper/core/extensions/string_ext.dart';
import 'package:assignment_pepper/domain/entities/home_operations/basic_operation_model.dart';

class OperationSalaryModel extends BasicOperationModel {
  final String operationDescription;

  OperationSalaryModel({
    required super.amount,
    required super.operationId,
    required super.operationType,
    required this.operationDescription
  });

  factory OperationSalaryModel.fromJson(Map<String, dynamic> json) =>
      OperationSalaryModel(
        amount: json["amount"] as double,
        operationId: json["operationId"] as int,
        operationDescription: json["operationDesc"] as String,
        operationType: OperationType.salary,
      );

  @override
  String toString() {
    return 'OperationSalaryModel{operationDescription: $operationDescription}';
  }
  bool containsValue(String value){
    return operationDescription.containsIgnoreLowerCase(value) || super.containsOperationType(value);
  }
}
