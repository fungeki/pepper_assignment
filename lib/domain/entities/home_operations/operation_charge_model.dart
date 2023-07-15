import 'package:assignment_pepper/core/extensions/string_ext.dart';
import 'package:assignment_pepper/domain/entities/home_operations/basic_operation_model.dart';

class OperationChargeModel extends BasicOperationModel {
  final String operationDescription;

  OperationChargeModel({
    required super.amount,
    required super.operationId,
    required super.operationType,
    required this.operationDescription
  });

  factory OperationChargeModel.fromJson(Map<String, dynamic> json) =>
      OperationChargeModel(
        amount: json["amount"] as double,
        operationId: json["operationId"] as int,
        operationDescription: json["operationDesc"] as String,
        operationType: OperationType.charge,
      );

  @override
  String toString() {
    return 'OperationChargeModel{operationDescription: $operationDescription}';
  }
  bool containsValue(String value){
    return operationDescription.containsIgnoreLowerCase(value) || super.containsOperationType(value);
  }
}
