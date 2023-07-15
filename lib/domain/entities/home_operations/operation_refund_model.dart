import 'package:assignment_pepper/core/extensions/string_ext.dart';
import 'package:assignment_pepper/domain/entities/home_operations/basic_operation_model.dart';

class OperationRefundModel extends BasicOperationModel {
  final String operationDescription;

  OperationRefundModel({
    required super.amount,
    required super.operationId,
    required super.operationType,
    required this.operationDescription
  });

  factory OperationRefundModel.fromJson(Map<String, dynamic> json) =>
      OperationRefundModel(
        amount: json["amount"] as double,
        operationId: json["operationId"] as int,
        operationDescription: json["operationDesc"] as String,
        operationType: OperationType.refund,
      );

  @override
  String toString() {
    return 'OperationRefundModel{operationDescription: $operationDescription}';
  }
  bool containsValue(String value){
    return operationDescription.containsIgnoreLowerCase(value) || super.containsOperationType(value);
  }
}
