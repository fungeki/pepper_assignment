import 'package:assignment_pepper/core/extensions/string_ext.dart';
import 'package:assignment_pepper/domain/entities/home_operations/basic_operation_model.dart';

class OperationSavingWithdrawalModel extends BasicOperationModel {
  final String operationDescription;

  OperationSavingWithdrawalModel(
      {required super.amount,
      required super.operationId,
      required super.operationType,
      required this.operationDescription});

  factory OperationSavingWithdrawalModel.fromJson(Map<String, dynamic> json) =>
      OperationSavingWithdrawalModel(
        amount: json["amount"] as double,
        operationId: json["operationId"] as int,
        operationDescription: json["operationDesc"] as String,
        operationType: OperationType.savingWithdrawal,
      );

  @override
  String toString() {
    return 'OperationSavingWithdrawalModel{operationDescription: $operationDescription}';
  }

  bool containsValue(String value) {
    return operationDescription.containsIgnoreLowerCase(value) ||
        super.containsOperationType(value);
  }
}
