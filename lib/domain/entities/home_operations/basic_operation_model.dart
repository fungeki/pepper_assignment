import 'package:assignment_pepper/core/extensions/string_ext.dart';

abstract class BasicOperationModel{
  final double amount;
  final int operationId;
  final OperationType operationType;

  BasicOperationModel({required this.amount,required this.operationId,required this.operationType});

  bool containsOperationType(String value){
    return operationType.searchType().containsIgnoreLowerCase(value);
  }
}

enum OperationType{
  cashWithdrawal,
  charge,
  savingWithdrawal,
  refund,
  salary
}

extension OperationTypeX on OperationType{
  String searchType(){
    return switch (this){
      OperationType.cashWithdrawal => "cash withdrawal",
      OperationType.charge => "charge",
      OperationType.savingWithdrawal => "saving withdrawal",
      OperationType.refund => "refund",
      OperationType.salary => "salary",
    };
  }
}

