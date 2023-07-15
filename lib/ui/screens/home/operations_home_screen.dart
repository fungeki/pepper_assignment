import 'package:assignment_pepper/data/repositories/operations_repository.dart';
import 'package:assignment_pepper/data/sources/operations/operations_mock_datasource.dart';
import 'package:assignment_pepper/domain/entities/home_operations/basic_operation_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_cash_withdrawal_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_charge_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_refund_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_salary_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_saving_withdrawal_model.dart';
import 'package:assignment_pepper/routes.dart';
import 'package:assignment_pepper/states/operations_bloc/operations_bloc.dart';
import 'package:assignment_pepper/ui/generics/loader_screen.dart';
import 'package:assignment_pepper/ui/generics/search_field.dart';
import 'package:assignment_pepper/ui/screens/home/widgets/cash_withdrawal_row.dart';
import 'package:assignment_pepper/ui/screens/home/widgets/charge_row.dart';
import 'package:assignment_pepper/ui/screens/home/widgets/income_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OperationsHomeScreen extends StatelessWidget {
  const OperationsHomeScreen({super.key});

  final headline = "Financial Operations";
  final dividerThickness = 1.5;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MultiRepositoryProvider(
      providers: [
        ///
        /// Data sources
        ///
        RepositoryProvider<OperationsMockDatasource>(
          create: (context) => OperationsMockDatasource(),
        ),

        ///
        /// Repositories
        ///
        RepositoryProvider<OperationsRepository>(
          create: (context) =>
              OperationsRepository(context.read<OperationsMockDatasource>()),
        ),
      ],
      child: BlocProvider(
        create: (context) =>
            OperationsBloc(context.read<OperationsRepository>())
              ..add(OperationsEventFetchData()),
        child: BlocConsumer<OperationsBloc, OperationsState>(
          buildWhen: (previous, current) =>
              current is! OperationsStateNavigation,
          listenWhen: (previous, current) =>
              current is OperationsStateNavigation,
          listener: (context, state) {
            if (state is OperationsStateNavigateToDetails) {
              AppNavigator.push(Routes.operationDetails, {
              "operation": state.operation
            });
            }
          },
          builder: (context, state) {
            final bloc = context.read<OperationsBloc>();
            switch (state.runtimeType) {
              case OperationsStateInitial:
              case OperationsStateLoading:
                return const LoaderScreen();
              case OperationsStateFinishedLoading:
                final stateFinishedLoading =
                    state as OperationsStateFinishedLoading;
                final operations = stateFinishedLoading.operations;
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    title: Text(headline, style: theme.textTheme.bodyLarge,),
                  ),
                  body: GestureDetector(
                    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SearchField(
                              onChanged: (value) => bloc.add(OperationsEventOnSearch(value)),
                            ),
                            Divider(
                              thickness: dividerThickness,
                            ),
                            Expanded(child: buildListView(operations, bloc))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              case OperationsStateError:
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  ListView buildListView(List<BasicOperationModel> operations, OperationsBloc bloc ){
    return ListView.separated(
                          shrinkWrap: true,
                          itemCount: operations.length,
                          itemBuilder: (context, index) {
                            final operation = operations[index];
                            switch (operation.operationType) {
                              case OperationType.cashWithdrawal:
                                return CashWithdrawalRow(
                                  operation: operation
                                      as OperationCashWithdrawalModel,
                                  onTap: ()=> bloc.add(OperationsEventOnTapRow(operation)),
                                );
                              case OperationType.charge:
                                return ChargeRow(
                                  operation:
                                      operation as OperationChargeModel,
                                  onTap: ()=> bloc.add(OperationsEventOnTapRow(operation)),
                                );
                              case OperationType.refund:
                                final refundOp =
                                    operation as OperationRefundModel;
                                return IncomeRow(
                                  operation: refundOp,
                                  description: refundOp.operationDescription,
                                  onTap: ()=> bloc.add(OperationsEventOnTapRow(operation)),
                                );
                              case OperationType.salary:
                                final salaryOp =
                                    operation as OperationSalaryModel;
                                return IncomeRow(
                                  operation: salaryOp,
                                  description: salaryOp.operationDescription,
                                  onTap: ()=> bloc.add(OperationsEventOnTapRow(operation)),
                                );
                              case OperationType.savingWithdrawal:
                                final savingOp = operation
                                    as OperationSavingWithdrawalModel;
                                return IncomeRow(
                                  operation: savingOp,
                                  description: savingOp.operationDescription,
                                  onTap: ()=> bloc.add(OperationsEventOnTapRow(operation)),
                                );
                            }
                          },
                          separatorBuilder:
                              (BuildContext context, int index) =>
                                  const Divider(),
                        );
  }
}
