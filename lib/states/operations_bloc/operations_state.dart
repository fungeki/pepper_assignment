part of 'operations_bloc.dart';

@immutable
abstract class OperationsState {}

class OperationsStateInitial extends OperationsState {}

class OperationsStateLoading extends OperationsState {}

class OperationsStateError extends OperationsState {}

class OperationsStateFinishedLoading extends OperationsState {
  final List<BasicOperationModel> operations;

  OperationsStateFinishedLoading(this.operations);
}


@immutable
abstract class OperationsStateNavigation extends OperationsState {
  final BasicOperationModel operation;

  OperationsStateNavigation(this.operation);
}

class OperationsStateNavigateToDetails extends OperationsStateNavigation{
  OperationsStateNavigateToDetails(super.operation);
}