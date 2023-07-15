import 'dart:async';

import 'package:assignment_pepper/data/repositories/operations_repository.dart';
import 'package:assignment_pepper/domain/entities/home_operations/basic_operation_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_cash_withdrawal_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_charge_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_refund_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_salary_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_saving_withdrawal_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'operations_event.dart';
part 'operations_state.dart';

class OperationsBloc extends Bloc<OperationsEvent, OperationsState> {
  final OperationsRepository repo;
  List<BasicOperationModel> allOperations = [];
  List<BasicOperationModel> filteredOperations = [];
  OperationsBloc(this.repo) : super(OperationsStateInitial()) {
    on<OperationsEventFetchData>(operationsEventFetchData);
    on<OperationsEventOnTapRow>(operationsEventOnTapRow);
    on<OperationsEventOnSearch>(operationsEventOnSearch);
  }

  FutureOr<void> operationsEventFetchData(OperationsEventFetchData event, Emitter<OperationsState> emit) async{
    emit(OperationsStateLoading());
    allOperations = await repo.getOperations();
    filteredOperations = List.from(allOperations);
    emit(OperationsStateFinishedLoading(filteredOperations));
  }

  FutureOr<void> operationsEventOnTapRow(OperationsEventOnTapRow event, Emitter<OperationsState> emit) {
    emit(OperationsStateNavigateToDetails(event.operationModel));
  }

  FutureOr<void> operationsEventOnSearch(OperationsEventOnSearch event, Emitter<OperationsState> emit) {
    final searchValue = event.searchValue;
    if (searchValue.isEmpty){
      filteredOperations = List.from(allOperations);
    }else {
      filteredOperations = allOperations.where((element) {
      switch (element.operationType){
        case OperationType.savingWithdrawal:
          return (element as OperationSavingWithdrawalModel).containsValue(searchValue);
          case OperationType.charge:
          return (element as OperationChargeModel).containsValue(searchValue);
          case OperationType.refund:
          return (element as OperationRefundModel).containsValue(searchValue);
          case OperationType.salary:
          return (element as OperationSalaryModel).containsValue(searchValue);
          case OperationType.cashWithdrawal:
          return (element as OperationCashWithdrawalModel).containsValue(searchValue);
      }
    }).toList();
    }
    emit(OperationsStateFinishedLoading(filteredOperations));
  }
}
