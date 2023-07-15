part of 'operations_bloc.dart';

@immutable
abstract class OperationsEvent {}

class OperationsEventFetchData extends OperationsEvent{}

class OperationsEventOnTapRow extends OperationsEvent{
  final BasicOperationModel operationModel;

  OperationsEventOnTapRow(this.operationModel);
}

class OperationsEventOnSearch extends OperationsEvent{
  final String searchValue;

  OperationsEventOnSearch(this.searchValue);
}
