import 'package:assignment_pepper/data/sources/operations/operations_mock_datasource.dart';
import 'package:assignment_pepper/domain/entities/home_operations/basic_operation_model.dart';

class OperationsRepository{
  OperationsRepository(this.datasource);

  final OperationsMockDatasource datasource;

  Future<List<BasicOperationModel>> getOperations()async{
    return await datasource.getOperations();
  }
}