import 'package:assignment_pepper/configs/colors.dart';
import 'package:assignment_pepper/domain/entities/home_operations/basic_operation_model.dart';
import 'package:flutter/material.dart';
class IncomeRow extends StatelessWidget {
  const IncomeRow({super.key, required this.operation, required this.description, required this.onTap});

  final BasicOperationModel operation;
  final String description;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final amount =
    operation.amount % 1 == 0 ? operation.amount.toInt() : operation.amount;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("$amount\$", style: textTheme.bodyMedium?.copyWith(color: AppColors.lightGreen),),
        Text(description),
        IconButton(onPressed: onTap, icon:Icon( Icons.info)),
      ],
    );
  }
}
