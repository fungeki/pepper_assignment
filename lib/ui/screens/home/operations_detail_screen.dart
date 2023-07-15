import 'package:assignment_pepper/domain/entities/home_operations/basic_operation_model.dart';
import 'package:flutter/material.dart';

class OperationsDetailScreen extends StatelessWidget {
  const OperationsDetailScreen({super.key, required this.operation});

  final headline = "Operation";
  final BasicOperationModel operation;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(headline, style: theme.textTheme.bodyLarge,),
      ),
      body: SafeArea(
        child: Center
          (child: Text(operation.operationId.toString()),),
      ),
    );
  }
}
