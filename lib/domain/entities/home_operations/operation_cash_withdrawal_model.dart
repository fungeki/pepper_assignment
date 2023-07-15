import 'package:assignment_pepper/core/extensions/string_ext.dart';
import 'package:assignment_pepper/domain/entities/home_operations/basic_operation_model.dart';

class OperationCashWithdrawalModel extends BasicOperationModel {
  final String source;
  final String address;

  OperationCashWithdrawalModel({
    required super.amount,
    required super.operationId,
    required super.operationType,
    required this.source,
    required this.address,
  });

  factory OperationCashWithdrawalModel.fromJson(Map<String, dynamic> json) =>
      OperationCashWithdrawalModel(
        amount: json["amount"] as double,
        operationId: json["operationId"] as int,
        source: json["source"] as String,
        address: json["address"] as String,
        operationType: OperationType.cashWithdrawal,
      );

  bool containsValue(String value){
    return source.containsIgnoreLowerCase(value) || address.containsIgnoreLowerCase(value) || super.containsOperationType(value);
  }
  @override
  String toString() {
    return 'OperationCashWithdrawalModel{source: $source, address: $address}';
  }
}
