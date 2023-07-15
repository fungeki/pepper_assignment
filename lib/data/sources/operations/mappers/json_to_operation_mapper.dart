import 'dart:developer';

import 'package:assignment_pepper/domain/entities/home_operations/basic_operation_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_cash_withdrawal_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_charge_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_refund_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_salary_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_saving_withdrawal_model.dart';

class BasicOperationsMapper{
  static BasicOperationModel? toOperationsModel(Map<String, dynamic> json) {
    try {
      final operationType = json["operationType"] as String;
      final operationTypeEnum = OperationType.values.firstWhere((element) {
        final enumStr = element.toString().split(".")[1].toLowerCase();
        log(enumStr.toString());
        final operationTypeStr = operationType.replaceAll("_", "").toLowerCase();
        return enumStr == operationTypeStr;
      });
      return switch (operationTypeEnum){
        OperationType.cashWithdrawal => OperationCashWithdrawalModel.fromJson(json),
        OperationType.salary => OperationSalaryModel.fromJson(json),
        OperationType.refund => OperationRefundModel.fromJson(json),
        OperationType.savingWithdrawal => OperationSavingWithdrawalModel.fromJson(json),
        OperationType.charge => OperationChargeModel.fromJson(json),
      };
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      return null;
    }
  }
}
